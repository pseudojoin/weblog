$("#comments_container").empty()
$("<%= escape_javascript(render @article.comments) %>").appendTo("#comments_container")
$("#comment_body").val("")