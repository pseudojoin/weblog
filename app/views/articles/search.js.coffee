$("#form").remove()
$("<%= escape_javascript(render 'search') %>").appendTo("#articles_contents")
$("#articles_search_form").on "ajax:success", (event, xhr) ->
  $("#articles_list").html(xhr)