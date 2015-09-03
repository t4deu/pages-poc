$(document).on "page:change", ->
  editor = new Editor({
    element: document.getElementById('page_body')
  })
  editor.render()

  $("#page_title").on "change paste keyup", (e) ->
    e.preventDefault()

    $("#page_slug").val getSlug(this.value)
