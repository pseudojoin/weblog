$ ->
  $("#articles_search_form").on "ajax:success", (event) ->
    [data, status, xhr] = event.detail
    console.log("data", data)
    console.log("articles_list", $("#articles_list"))
    console.log("articles_list.length", $("#articles_list").length)
    # $("#articles_list").html data