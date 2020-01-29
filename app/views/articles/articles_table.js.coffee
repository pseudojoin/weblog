$("#form").remove()
$("<%= escape_javascript(render 'articles_table') %>").appendTo("#articles_contents")