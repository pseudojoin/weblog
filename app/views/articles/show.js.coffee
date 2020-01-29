$("#form").remove()
$("<%= escape_javascript(render 'show') %>").appendTo("#articles_contents")