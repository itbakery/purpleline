// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

 jQuery(document).ready(function() {
    jQuery("#accordion" ).accordion({
                      collapsible: true,
                      autoHeight: false,
                      autoHeight: false,

   	 	});
	
    jQuery('#announces_translation_start_on').datepicker({numberOfMonths:2});
    jQuery('#announces_translation_stop_on').datepicker({numberOfMonths:2});
    
    jQuery('#events_translation_start_on').datepicker({numberOfMonths:2});
    jQuery('#events_translation_stop_on').datepicker({numberOfMonths:2});
    
    jQuery('#newsletters_translation_start_on').datepicker({numberOfMonths:2});
    jQuery('#newsletters_translation_stop_on').datepicker({numberOfMonths:2});    
    
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
    
    function remove_fields(link) {
  jQuery(link).prev("input[type=hidden]").val("1");
  jQuery(link).closest(".fields").hide();
}

function add_fields(link, association, content) {
  var new_id = new Date().getTime();
  var regexp = new RegExp("new_" + association, "g")
  jQuery(link).parent().before(content.replace(regexp, new_id));
}


});


