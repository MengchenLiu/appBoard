document.addEventListener("turbolinks:load",function(){

  $("#sortable").sortable({
    update: function(e,ui){
      //console.log($(this).sortable('serialize'));
      $.post($(this).data('update-url'),$(this).sortable('serialize'))
    }
  });
});
