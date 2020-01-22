$ ->
  $("#articles_search_form").on "ajax:success", (event) ->
    [data, status, xhr] = event.detail
    console.log("data", data)
    $("#articles_list").css("color", "red")
    $("#articles_list").html(xhr.responseText)