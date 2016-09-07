Vue.component('error-row', {
  template: '#error-row',
  props: {
    error: Object
  },
  data: function () {
    return {

    }
  },
  computed:{
      debug_data_string: function(){
        return JSON.stringify(this.error.debug_data);
      }
    },
  methods: {
    toggle_error_display: function () {
      var that = this
      that.display_error = !that.display_error
    }
  }
})