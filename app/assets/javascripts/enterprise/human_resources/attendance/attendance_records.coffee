# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

window.Parsley
.addValidator('timeIn',
  {
    requirementType: 'string',
    validateString: (value, requirement) -> {
      something = $('attendance_record_time_in').val()
      alert something
    },
    messages: { en: 'This value should be a multiple of %s' }
  })