$(document).ready ->

  # Reloads Rows
  $('.expense_row').hide()
  $('.expense_row.root').show()

  $('.hierarchy_option_button').funcToggle( 'click',
    ->
      # open immediate children
      $(this).html('&#9660;')
      account_id = $(this).data( "account_id" )
      $("tr.expense_row[data-immediate_parent='" + account_id + "']").show()
    ->
      # close all children including descendants
      account_id = $(this).data( "account_id" )

      $('tr.expense_row[data-ancestor_ids]').each (index, element) =>
        ancestor_string = $(element).data("ancestor_ids")
        if ancestor_string.indexOf(account_id) == 1
          $(element).children('.hierarchy_option_button').html('&#9654;')
          $(element).hide()

      $(this).html('&#9654;')
      $("tr.expense_row[data-immediate_parent='" + account_id + "']").hide()

  )