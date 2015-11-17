$(document).on('page:change', function(){
  var context = {alert: "Isn't this _keen_? Right?", type: "success"};
  var html    = render_handlebars(context);
  $('.container').first().prepend(html);
});

$(document).on('click', "#login-button", function(){
  $('.alert').hide();
  var context = {alert: "You can't do that here.", type: "danger"};
  $('.container').first().prepend(render_handlebars(context));
  return false;
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
