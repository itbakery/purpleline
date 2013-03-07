// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
    function remove_fields(link) {
       jQuery(link).prev("input[type=hidden]").val("1");
       jQuery(link).closest(".fields").hide();
     }

    function add_fields(link, association, content) {
       var new_id = new Date().getTime();
       var regexp = new RegExp("new_" + association, "g")
       jQuery(link).parent().before(content.replace(regexp, new_id));
    }

//Map ploy

var COLORS = [["red", "#ff0000"], ["orange", "#ff8800"], ["green","#008000"],
              ["blue", "#000080"], ["purple", "#800080"]];
var options = {};
var lineCounter_ = 0;
var shapeCounter_ = 0;
var markerCounter_ = 0;
var colorIndex_ = 0;
var featureTable_;
var map;

function select(buttonId) {
  document.getElementById("hand_b").className="unselected";
  document.getElementById("shape_b").className="unselected";
  document.getElementById("line_b").className="unselected";
  document.getElementById("placemark_b").className="unselected";
  document.getElementById(buttonId).className="selected";
}

function stopEditing() {
  select("hand_b");
}

function getColor(named) {
  return COLORS[(colorIndex_++) % COLORS.length][named ? 0 : 1];
}

function getIcon(color) {
  var icon = new GIcon();
  icon.image = "http://google.com/mapfiles/ms/micons/" + color + ".png";
  icon.iconSize = new GSize(32, 32);
  icon.iconAnchor = new GPoint(15, 32);
  return icon;
}

function startShape() {
  select("shape_b");
  var color = getColor(false);
  var polygon = new GPolygon([], color, 2, 0.7, color, 0.2);
  startDrawing(polygon, "Shape " + (++shapeCounter_), function() {
    var cell = this;
    var area = polygon.getArea();
    cell.innerHTML = (Math.round(area / 10000) / 100) + "km<sup>2</sup>";
  }, color);
}

function startLine() {
  select("line_b");
  var color = getColor(false);
  var line = new GPolyline([], color);

    startDrawing(line, "Line " + (++lineCounter_), function() {
    var cell = this;
    var len = line.getLength();
    cell.innerHTML = (Math.round(len / 10) / 100) + "km";
  }, color);
}

function addFeatureEntry(name, color) {
  currentRow_ = document.createElement("tr");
  var colorCell = document.createElement("td");
  currentRow_.appendChild(colorCell);
  colorCell.style.backgroundColor = color;
  colorCell.style.width = "1em";
  var nameCell = document.createElement("td");
  currentRow_.appendChild(nameCell);
  nameCell.innerHTML = name;
  var descriptionCell = document.createElement("td");
  currentRow_.appendChild(descriptionCell);
  featureTable_.appendChild(currentRow_);
  return {desc: descriptionCell, color: colorCell};
}

function startDrawing(poly, name, onUpdate, color) {
  map.addOverlay(poly);
  poly.enableDrawing(options);
  poly.enableEditing({onEvent: "mouseover"});
  poly.disableEditing({onEvent: "mouseout"});
  //add by sawangpong
  var path=[];
  var data_path="";
  GEvent.addListener(poly, "endline", function() {
    var c = poly.getVertexCount();
    //alert(c);
    for (var i=0; i < c ; i++){
	  var latlng = poly.getVertex(i);
	  //path.push("point "+(i+1)+ "  is " + latlng.lat()+ "  " + latlng.lng()+"\r\n");
	  path.push("item " + (i+1) + " " +latlng.lat()+ "  " + latlng.lng()+ "  " + color + "\r\n");
	}
	jQuery.each(path,function(index,value){
	  data_path += value;
    });
     //alert("debug");
     jQuery("#announces_translation_polypoint").val(data_path);
     jQuery("#events_translation_polypoint").val(data_path);
    //end

    GEvent.addListener(poly,"lineupdated",function(){
		var newpath=[];
		var newdata_path="";
		var nc = poly.getVertexCount();
		alert(nc);
		for (var i=0; i < nc ; i++){
			 var newlatlng = poly.getVertex(i);
			newpath.push("item " + (i+1) + " " +newlatlng.lat()+ "  " + newlatlng.lng()+ " "+ color+ "\r\n");
		}
		jQuery.each(newpath,function(index,value){
	       newdata_path += value;
        });
         jQuery("#announces_translation_polypoint").val(newdata_path);
         jQuery("#events_translation_polypoint").val(newdata_path);
	});

    select("hand_b");
    var cells = addFeatureEntry(name, color);
    GEvent.bind(poly, "lineupdated", cells.desc, onUpdate);
    GEvent.addListener(poly, "click", function(latlng, index) {
      if (typeof index == "number") {
        poly.deleteVertex(index);
      } else {
        var newColor = getColor(false);
        cells.color.style.backgroundColor = newColor
        poly.setStrokeStyle({color: newColor, weight: 4});
      }
    });
  });
}

function placeMarker() {
  select("placemark_b");
  var listener = GEvent.addListener(map, "click", function(overlay, latlng) {
    if (latlng) {
      select("hand_b");
      GEvent.removeListener(listener);
      var color = getColor(true);
      var marker = new GMarker(latlng, {icon: getIcon(color), draggable: true});
      map.addOverlay(marker);
      var cells = addFeatureEntry("Placemark " + (++markerCounter_), color);
      updateMarker(marker, cells);
      GEvent.addListener(marker, "dragend", function() {
        updateMarker(marker, cells);
      });
      GEvent.addListener(marker, "click", function() {
        updateMarker(marker, cells, true);
      });
    }
  });
}


function updateMarker(marker, cells, opt_changeColor) {
  if (opt_changeColor) {
    var color = getColor(true);
    marker.setImage(getIcon(color).image);
    cells.color.style.backgroundColor = color;
  }
  var latlng = marker.getPoint();
  cells.desc.innerHTML = "(" + Math.round(latlng.y * 100) / 100 + ", " +
  Math.round(latlng.x * 100) / 100 + ")";
}

//end map
 jQuery(document).ready(function() {
    //map
    //select("hand_b");
    jQuery("#geoevent_polypoint").val("");
   //end map
    jQuery("#accordion" ).accordion({
                      collapsible: true,
                      autoHeight: false,
                      autoHeight: false,

   	 	});

    jQuery('#announces_translation_start_on').datepicker({numberOfMonths:2});
    jQuery('#announces_translation_stop_on').datepicker({numberOfMonths:2});

    jQuery('#events_translation_start_on').datepicker({numberOfMonths:2});
    jQuery('#events_translation_stop_on').datepicker({numberOfMonths:2});

    jQuery('#newsletters_translation_start_on').datepicker({numberOfMonths:2, dateFormate: 'dd/mm/yy'});
    jQuery('#newsletters_translation_stop_on').datepicker({numberOfMonths:2, dateFormate: 'dd/mm/yy' });

    jQuery('#tasks_translation_start_on').datepicker({numberOfMonths:2});
    jQuery('#tasks_translation_stop_on').datepicker({numberOfMonths:2});

    jQuery('#pages_translation_start_on').datepicker({numberOfMonths:2});
    jQuery('#pages_translation_stop_on').datepicker({numberOfMonths:2});

    jQuery('#new_events_translation_start_on').datepicker({numberOfMonths:2});
    jQuery('#new_events_translation_stop_on').datepicker({numberOfMonths:2});

    jQuery('#progress_issuedate').datepicker({numberOfMonths:2});


   jQuery('div.mrtalink').click(function(){location.href='http://www.mrta.co.th'});
    jQuery('div.mrtalink').css('cursor','pointer');


    jQuery('div.pcpl').click(function(){location.href='http://mrta-purpleline.com/project',target='_blank'});
    jQuery('div.pcpllink').css('cursor','pointer');

    jQuery('#tabs').tabs();
    jQuery('#tabs').tabs('paging', { cycle: true, follow: true } );

    jQuery('#menuleft  li').hover(
                    function(){
    		         jQuery('ul',this).slideDown(100);
    		    },
    		    function(){
    		    	 jQuery('ul',this).slideUp(100);
    		    }
    );

    jQuery('#memberform').dialog({autoOpen: false,width: 550,title:'move marker to your location'});

    jQuery('a[rel*=facebox]').facebox();

    jQuery('#tabs').tabs();
    jQuery('.lightbox').lightBox();

    jQuery('#marquee').marquee();

});


