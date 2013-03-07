/**
 * Google Maps API 2.0
 * MapBox integration.
 *
 * Do not remove the MapBox or OpenStreetMap attribution from this code,
 * doing so is in violation of the terms of both licenses.
 */

/**
 * Factory function for a MapBox layer for use with a
 * Google Map
 *
 * @param {string} layername
 *  layername in the TMS schema
 * @param {string} layertitle
 *  layer will be called in the user interface
 * @param {object} options
 *   minZoom - minimum zoomed out
 *   maxZoom - maximum zoomed in
 *   overlay - boolean, whether an overlay or not
 *   type - filetype, default png
 *   opacity - int opacity of tile overlays
 * @return {GMapType} map
 *  GMapType object 
 */
var GMapBox;
GMapBox = function(layername, layertitle, options) {
  var copyright, copyrightCollection, tilelayers, GMapTypeOptions;
  if(options === undefined) {
    options = {};
  }
  if(options.minZoom === undefined) {
    options.minZoom = 0;
  }
  if(options.maxZoom === undefined) {
    options.maxZoom = 13;
  }
  if(options.type === undefined) {
    options.type = 'png';
  }

  if(options.osm) {
    // Copyright info with OpenStreetMap Attribution
    copyright = new GCopyright(1,
      new GLatLngBounds(new GLatLng(-90,-180),new GLatLng(90,180) ),
      0, "<a href='http://mapbox.com/'><img src='http://js.mapbox.com/img/mapbox.png'></a><br />Data &copy; OSM CCBYSA");
  } else {
    // Copyright info
    copyright = new GCopyright(1,
      new GLatLngBounds(new GLatLng(-90,-180),new GLatLng(90,180) ),
      0, "<a href='http://mapbox.com/'><img src='http://js.mapbox.com/img/mapbox.png'></a><br />");
  }

  copyrightCollection = new GCopyrightCollection();
  copyrightCollection.addCopyright(copyright);
  
  // Function for getTileUrl
  CustomTilesUrl = function(a,b){
    // Y coordinate is flipped in Mapbox, compared to Google
    a.y = Math.abs(a.y - (Math.pow(2,b) - 1));
    return "http://a.tile.mapbox.com/1.0.0/" + layername + "/" + b + "/" + a.x + "/" + a.y + "." + options.type;
  };

  // Generate and return a base or overlay layer
  if(options.overlay === true) {    
    tilelayers = new GTileLayer(copyrightCollection, options.minZoom, options.maxZoom);
    tilelayers.getTileUrl = CustomTilesUrl;
    tilelayers.isPng = function() { return (options.type === 'png');};
    tilelayers.getOpacity = function() { return options.opacity; };
    return new GTileLayerOverlay(tilelayers);
  }
  else {
    tilelayers = [new GTileLayer(copyrightCollection,options.minZoom,options.maxZoom)];
    tilelayers[0].getTileUrl = CustomTilesUrl;
    // Default options for the new map type.
    GMapTypeOptions = {minResolution: options.minZoom, maxResolution: options.maxZoom};
    return new GMapType(tilelayers, 
      new GMercatorProjection(options.maxZoom + 1), 
      layertitle, 
      GMapTypeOptions);
  }
};
