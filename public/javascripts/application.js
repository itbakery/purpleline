// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
$(document).ready(function() {
   $('#tabs').tabs();
   $('#tabs').tabs('paging', { cycle: true, follow: true } );
   $('#s3slider').s3Slider({timeOut: 9000 });
   $('#slider').s3Slider({timeOut: 9000});
   $('#announces_translation_start_on').datepicker();
   $('#announces_translation_stop_on').datepicker();
});


