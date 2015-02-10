$(document).ready(function(){
   $(".button-collapse").sideNav();
   $('select').material_select();
   $('.modal-trigger').leanModal();
   $('.collapsible').collapsible();
   hljs.initHighlightingOnLoad();
   $(".generated-query .collapsible-header").trigger("click");
})
