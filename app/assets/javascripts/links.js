$(document).on('page:change', function(){
  $('.alert').remove();
  var context = {alert: "Isn't this _keen_? Right?", type: "success"};
  var html    = render_handlebars(context);
  $('.container').first().prepend(html);
});

function handlebars_template(selector){
  var source   = $(selector).html();
  var template = Handlebars.compile(source);
  return template
}

function render_handlebars(context) {
  var template = handlebars_template("#extra_template");
  return template(context);
}

$(document).on('click', 'a[data-background-color]', function(el){
  if($(this).attr('data-foreground-color') != undefined){
    var forecolor = $(this).attr('data-foreground-color');
  }else{
    var forecolor = "#ffffff";
  }
  var bgcolor = $(this).attr('data-background-color');
  $(this).css("background-color", bgcolor);
  $(this).css('color', forecolor);
});
