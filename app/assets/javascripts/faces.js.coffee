$ ->
  $("#search").focus()

  $("#get_face").click ->
    email = $("#search").val()
    if (email)
      $("#face_container").addClass("hidden")
      $("#no_face").addClass("hidden")
      $("#spinner").removeClass("hidden")
      $.ajax
        type: "GET"
        url: "/find?&email=#{email}"
        success: (data) ->
          $("#face").attr("src", data.url + "?&type=large")
          $("#json").attr('href', "/faces/#{data.id}.json")
          $("#face_container").removeClass("hidden")
          $("#spinner").addClass("hidden")
        error: ->
          $("#spinner").addClass("hidden")
          $("#no_face").removeClass("hidden")

  $("#search").keypress (event) ->
    $("#get_face").get(0).click() if event.keyCode == 13