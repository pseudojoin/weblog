$("#form").remove()
$("<%= escape_javascript(render 'edit') %>").appendTo("#articles_contents")