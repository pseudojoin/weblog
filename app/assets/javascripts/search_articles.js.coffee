$ ->
  $("#articles_search_form").on "ajax:success", (event) ->
    [data, status, xhr] = event.detail
    $("#articles_list").html(xhr.responseText)