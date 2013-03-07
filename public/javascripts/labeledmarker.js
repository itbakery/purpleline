/**
 * @name LabeledMarker
 * @version 1.3.1
 * @author Mike Purvis (http://uwmike.com)
 * @copyright (c) 2007 Mike Purvis (http://uwmike.com)
 * @fileoverview
 *     <p>This library extends the Maps API's standard GMarker class
 *         with the ability to support markers with textual labels. Please
 *         see articles here:</p>
 *     <ul>
 *       <li>http://googlemapsbook.com/2007/01/22/extending-gmarker/</li>
 *       <li>http://googlemapsbook.com/2007/03/06/clickable-labeledmarker/</li>
 *     </ul>
 */

/*
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *       http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/*
 * v1.3.1 Sergey Ushakov 30-Nov-2008
 * - new API method setLabelText() proposed by lemnar, see
 *   http://code.google.com/p/gmaps-utility-library-dev/issues/detail?id=19 ;
 * - change label visibility control from 'visibility'-based to
 *   'display'-based as per lemnar's proposal, see
 *   http://code.google.com/p/gmaps-utility-library-dev/issues/detail?id=35 ;
 * - minor changes to jsdoc comments;
 *
 * v1.3 Sergey Ushakov 23-Nov-2008
 * - allow setting visibility before .initialize()/.addOverlay();
 * - provide consistent label visibility control aligned with visibility of
 *   the marker itself;
 * - fix the issue that the marker is always added to a map in visible state
 *   regardless of any visibility settings applied before;
 * - fix to the event passing mechanism by Nianwei Liu
 *   ( http://groups.google.com/group/google-maps-utility-library/browse_thread/thread/2099a45b76dc6dbe?hl=en&q=#55d813379dde8c66 )
 *   and other minor syntax fixes to make jslint more happy :)
 */


/**
 * @name LabeledMarkerOptions
 * @class This class extends <code>GMarkerOptions</code>. Instances of this
 *     class are used in the <code>opt_opts</code> argument to the
 *     constructor of the {@link LabeledMarker} class. At this time the
 *     <code>draggable</code> property is not supported and is forced to be
 *     <code>false</code>.
 * @property {String} [labelText] Label text/html to place in the overlay div
 *     (defaults to empty string).
 * @property {String} [labelClass] Class to use for the overlay div
 *     (default "LabeledMarker_markerLabel").
 * @property {GSize} [labelOffset] Label offset, the x- and y-distance
 *     between the marker's latlng and the upper-left corner of the text div
 *     (default (0,0)).
 */


/**
 * Creates a marker with options specified in {@link LabeledMarkerOptions}
 *     (extension of <code>GMarkerOptions</code>). Creates a div for the
 *     label and then calls the <code>GMarker</code> constructor.
 * @constructor
 * @param {GLatLng} latlng Initial marker position
 * @param {LabeledMarkerOptions} [opt_opts] Named optional arguments.
 */
 

function LabeledMarker(latlng, opt_opts) {
  this.latlng_ = latlng;
  this.opts_ = opt_opts;

  this.labelText_ = opt_opts.labelText || "";
  this.labelClass_ = opt_opts.labelClass || "LabeledMarker_markerLabel";
  this.labelOffset_ = opt_opts.labelOffset || new GSize(0, 0);

  this.clickable_ = opt_opts.clickable || true;
  this.title_ = opt_opts.title || "";
  this.labelVisibility_  = true;
  // "ownVisibility_ is a workaround for the issue with GMarker that it
  // (unlike other GOverlay subclasses) is always visible after addOverlay(),
  // regardless of any visibility settings applied before it; this attribute
  // may eventually go away, when GMarker behavior allows...
  this.ownVisibility_ = true;

  this.div_ = document.createElement("div");
  this.div_.className = this.labelClass_;
  this.div_.innerHTML = this.labelText_;
  this.div_.style.position = "absolute";
  this.div_.style.cursor = "pointer";
  this.div_.title = this.title_;

  if (opt_opts.draggable) {
  	// This version of LabeledMarker doesn't support dragging.
  	opt_opts.draggable = false;
  }

  GMarker.apply(this, arguments);
}


// It's a limitation of JavaScript inheritance that we can't conveniently
// inherit from GMarker without having to run its constructor. In order for
// the constructor to run, it requires some dummy GLatLng.
LabeledMarker.prototype = new GMarker(new GLatLng(0, 0));

/**
 * Is called by <code>GMap2</code>'s <code>addOverlay()</code> method. Adds
 *     the text div to the relevant parent div.
 * @param {GMap2} map The map to add this <code>LabeledMarker</code> to.
 */
LabeledMarker.prototype.initialize = function (map) {
  // Do the GMarker constructor first.
  GMarker.prototype.initialize.apply(this, arguments);

  this.map_ = map;

  if (!this.ownVisibility_) {
    this.hide();
  }
  this.applyLabelVisibility_();
  map.getPane(G_MAP_MARKER_PANE).appendChild(this.div_);

  if (this.clickable_) {
    // Pass through events fired on the text div to the marker.
    var eventPassthrus = ['click', 'dblclick', 'mousedown', 'mouseup', 'mouseover', 'mouseout'];
    for (var i = 0; i < eventPassthrus.length; i++) {
      var name = eventPassthrus[i];
      GEvent.addDomListener(this.div_, name, GEvent.callback(GEvent, GEvent.trigger, this, name));
    }
  }
};


/**
 * Calls the redraw() handler in <code>GMarker</code> and our
 *     <code>redrawLabel_()</code> function.
 * @param {Boolean} force Will be true when pixel coordinates need to be
 *   recomputed.
 */
LabeledMarker.prototype.redraw = function (force) {
  GMarker.prototype.redraw.apply(this, arguments);
  this.redrawLabel_();
};


/**
 * Moves the text div based on current projection and zoom level.
 * @private
 */
LabeledMarker.prototype.redrawLabel_ = function () {
  // Calculate the DIV coordinates of two opposite corners of our bounds to
  // get the size and position of our rectangle
  var p = this.map_.fromLatLngToDivPixel(this.latlng_);
  var z = GOverlay.getZIndex(this.latlng_.lat());

  // Now position our div based on the div coordinates of our bounds
  this.div_.style.left = (p.x + this.labelOffset_.width) + "px";
  this.div_.style.top = (p.y + this.labelOffset_.height) + "px";
  this.div_.style.zIndex = z; // in front of the marker
};


/**
 * Remove the text div from the map pane, destroy event passthrus, and calls
 *     the default <code>remove()</code> handler in <code>GMarker</code>.
 */
LabeledMarker.prototype.remove = function () {
  GEvent.clearInstanceListeners(this.div_);
  if (this.div_.outerHTML) {
    this.div_.outerHTML = ""; //prevent pseudo-leak in IE
  }
  if (this.div_.parentNode) {
    this.div_.parentNode.removeChild(this.div_);
  }
  this.div_ = null;
  GMarker.prototype.remove.apply(this, arguments);
};


/**
 * Return a copy of this overlay, for the parent <code>GMap2</code> to
 *     duplicate itself in full. This is part of the <code>GOverlay</code>
 *     interface and is used, for example, to copy everything in the main
 *     view into a mini-map.
 */
LabeledMarker.prototype.copy = function () {
  return new LabeledMarker(this.latlng_, this.opts_);
};


/**
 * Shows the marker and shows the label if it wasn't hidden. Note that this
 *     function triggers the <code>GMarker.visibilitychanged</code> event in
 *     case the marker is currently hidden.
 */
LabeledMarker.prototype.show = function () {
  GMarker.prototype.show.apply(this, arguments);
  this.ownVisibility_ = true;
  this.applyLabelVisibility_();
};


/**
 * Hides the marker and the label if they are currently visible. Note that
 *     this function triggers the <code>GMarker.visibilitychanged</code>
 *     event in case the marker is currently visible.
 */
LabeledMarker.prototype.hide = function () {
  GMarker.prototype.hide.apply(this, arguments);
  this.ownVisibility_ = false;
  this.applyLabelVisibility_();
};


/**
 * Repositions label and marker.
 *
 * @param {GLatLng} latlng New marker position
 */
LabeledMarker.prototype.setLatLng = function (latlng) {
  this.latlng_ = latlng;
  GMarker.prototype.setLatLng.apply(this, arguments);
  this.redrawLabel_();
};


/**
 * Sets the visibility of the label, which will be respected during
 *     show/hides. If marker is visible when set, it will show or hide label
 *     appropriately.
 * @param {Boolean} visibility New label visibility status
 */
LabeledMarker.prototype.setLabelVisibility = function (visibility) {
  this.labelVisibility_ = visibility;
  this.applyLabelVisibility_();
};


/**
 * Returns whether label visibility is set on.
 * @return {Boolean}
 */
LabeledMarker.prototype.getLabelVisibility = function () {
  return this.labelVisibility_;
};


/**
 * Updates actual label visibility depending on marker and label settings.
 * @private
 */
LabeledMarker.prototype.applyLabelVisibility_ = function () {
  if ((!this.isHidden()) && this.labelVisibility_) {
    this.showLabel();
  } else {
    this.hideLabel();
  }
};


/**
 * Hides the label of the marker. Note that this does not persist after a
 *     marker hide/show.
 */
LabeledMarker.prototype.hideLabel = function () {
//  this.div_.style.visibility = 'hidden';
  this.div_.style.display = 'none';
};


/**
 * Shows the label of the marker. Note that this does not persist after a
 *     marker hide/show.
 */
LabeledMarker.prototype.showLabel = function () {
//  this.div_.style.visibility = 'visible';
  this.div_.style.display = 'block';
};


/**
 * Sets label text/html for the marker.
 * @param {String} text New text/html for the label
 */
LabeledMarker.prototype.setLabelText = function (text) {
	this.labelText_ = text;
	this.div_.innerHTML = text;
};


