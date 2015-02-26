$ ->
  $('#comments').imagesLoaded ->
    $('#comments').masonry
      itemSelector: '.box'
      isFitWidth: true
