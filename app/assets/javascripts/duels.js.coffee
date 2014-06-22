# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
#$(document).ready ->
#        $('#duel_artist_a_name').autocomplete
#                source: "/artists"
#                select: (event,ui) -> $("#post_user_id").val(ui.item.id)
 $(document).ready ->
                $('#duel_deadline').datetimepicker(
                    useSeconds: false,
                    showTimePicker: true
                )

  $('.button').submit ->
                  alert('yey')
            