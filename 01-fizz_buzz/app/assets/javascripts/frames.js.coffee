# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

fz = window.fz || {}

fz.frames = (($) ->
  init = ->
    $ ->
      console.debug "Initilizing Frames JS"
      bind_edit_frame_form_events()

  bind_edit_frame_form_events = ->
    $(document).on('ajax:success', '[id^="edit_frame"]', (event, data, status) ->
      if data.correct
        flash_correct()
        setTimeout ->
          find_or_create_frame_and_redirect()
        , 750
      else
        game_id = $('[id^="edit_frame"]').data('game-id')
        flash_incorrect()
        setTimeout ->
          window.location = "/games/#{game_id}"
        , 750
    ).on('ajax:error', '[id^="edit_frame"]', (event, status, error) ->
      flash_error(error)
    )

  find_or_create_frame_and_redirect = ->
    game_id = $('[id^="edit_frame"]').data('game-id')
    next_frame_id = $('[id^="edit_frame"]').data('next-frame-id')

    if next_frame_id
      return window.location = "/games/#{game_id}/frames/#{next_frame_id}/edit"

    position = $('[id^="edit_frame"]').data('position')

    if position < 100
      $.ajax(
        url: "/games/#{game_id}/frames.json"
        method: 'post'
      ).done((frame) ->
        window.location = "/games/#{game_id}/frames/#{frame.id}/edit"
      )
    else
      window.location = "/games/#{game_id}"

  flash = (kind, message) ->
    alert = $('<div data-alert="" class="alert-box radius">').addClass("#{kind}").html(message + '<a href="" class="close">×</a>')
    $('#alert-wrapper').append(alert)

  flash_correct = ->
    console.debug "Correct!"
    flash('success', "Correct!")

  flash_incorrect = ->
    console.debug "Incorrect!"
    flash('alert', "Incorrect!")

  flash_error = (error) ->
    console.debug "Error:", error

  init: init
)(jQuery)

jQuery fz.frames.init
