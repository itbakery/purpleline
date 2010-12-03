// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

 $(document).ready(function() {
   $( "#accordion" ).accordion({
                      collapsible: true,
                      autoHeight: false,
                      autoHeight: false,

   	 	});
	
   $('#announces_translation_start_on').datepicker({numberOfMonths:2});
   $('#announces_translation_stop_on').datepicker({numberOfMonths:2});

   $('#tasks_translation_start_on').datepicker({numberOfMonths:2});
   $('#tasks_translation_stop_on').datepicker({numberOfMonths:2});
   
   $('#pages_translation_start_on').datepicker({numberOfMonths:2});
   $('#pages_translation_stop_on').datepicker({numberOfMonths:2});
   
   $('#new_events_translation_start_on').datepicker({numberOfMonths:2});
   $('#new_events_translation_stop_on').datepicker({numberOfMonths:2});  
   
   
   $('div.mrtalink').click(function(){location.href='http://www.mrta.co.th'});
   $('div.mrtalink').css('cursor','pointer');
   
   
   $('div.pcpl').click(function(){location.href='http://mrta-purpleline.com/project',target='_blank'});
   $('div.pcpllink').css('cursor','pointer');
   
   $('#tabs').tabs();
   $('#tabs').tabs('paging', { cycle: true, follow: true } ); 
   

});


