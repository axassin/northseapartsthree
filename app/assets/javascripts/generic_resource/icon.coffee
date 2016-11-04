jQuery ($) ->

  # Initialize Grid - Packery
  $grid = $('.grid').packery({
    itemSelector: '.grid-item',
    gutter: 10
  });

  $.each $grid.find('.grid-item'), (number, grid_item) ->
    draggie = new Draggabilly( grid_item )
    $grid.packery( 'bindDraggabillyEvents', draggie )
