jQuery ($) ->

  # Get Element
  $grid = $('.grid')

  # Initialize Grid - Packery
  $grid.imagesLoaded ->
    $grid.packery({
      itemSelector: '.grid-item',
      gutter: 10
    });

    $.each $grid.find('.grid-item'), (number, grid_item) ->
      draggie = new Draggabilly( grid_item )
      $grid.packery( 'bindDraggabillyEvents', draggie )

    # Destroy Packery if Printable
    if printable == true
      $grid.packery('destroy')