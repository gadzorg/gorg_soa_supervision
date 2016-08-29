App.rabbitmq_activity = App.cable.subscriptions.create "RabbitmqActivityChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    console.log(data)
    $('#messages_list tr:first').before(data.message)
    first=$('#messages_list tr:first')
    first.addClass( "new" ).delay(1000).queue(() ->
      $(this).removeClass("new")
      $(this).dequeue()
    )
                       