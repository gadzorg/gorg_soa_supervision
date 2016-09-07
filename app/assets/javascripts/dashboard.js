var app = new Vue({
  el: '#dashboard-app',
  data: function() {
    return {
      events: [],
    }
  },
  ready: function() {
    var that;
    that = this;
    $.ajax({
      url: '/events.json',
      success: function(res) {
        console.log(res);
        that.events = res;
      }
    });
  },
});