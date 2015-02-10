$(document).ready(function(){
   $(".button-collapse").sideNav();

   var updateHtmls = function(result) {
     var querySource = $("script#es-query").html();
     var queryTemplate = Handlebars.compile(querySource);
     var queryHtml = queryTemplate(result.query);
     $("div#es-query").html(queryHtml);

     var humansSource = $("script#es-humans").html();
     var humansTemplate = Handlebars.compile(humansSource);
     var humansHtml = humansTemplate(result);
     $("div#es-humans").html(humansHtml);
   }


   $('form').on("submit", function(e) {
     data = $(this).serialize();
     $.get("/search?" + data, updateHtmls)
     return false;
   })

   $("form").trigger("submit");
})
