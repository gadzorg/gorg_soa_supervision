Vue.component('event-row', {
  template: '#event-row',
  props: {
    event: Object
  },
  data: function () {
    return {
      display_details: false
    }
  },
  computed:{
      data_string: function() {
        return JSON.stringify(this.event.data);
      }
    },
  methods: {
    toggle_details_display: function () {
      var that = this
      that.display_details = !that.display_details
    }
  }
})