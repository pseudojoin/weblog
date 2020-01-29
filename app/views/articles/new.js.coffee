$("#form").remove()
$("<%= escape_javascript(render 'new') %>").appendTo("#articles_contents")