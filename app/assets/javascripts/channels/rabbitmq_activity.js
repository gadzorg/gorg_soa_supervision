App.rabbitmq_activity = App.cable.subscriptions.create("RabbitmqActivityChannel", {
  connected: function() {},
  disconnected: function() {},
  received: function(data) {
    var event;
    console.log(data);
    event = data.message;
    app.events=app.events.filter(function(item) {
      return item.uuid !== event.uuid;
    });
    return app.events.push(event);
  }
})