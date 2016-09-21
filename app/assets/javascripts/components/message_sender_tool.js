Vue.component('message-sender-tool', {
  template: '#message-sender-tool',
  props: {
  },
  data: function () {
    return {
      routing_key: "",
      data: "",
      sender: "",
      response: null
    }
  },
  ready:function(){
        var that=this;
        var form= $('#message-sender-form');

        form.submit(function(ev){
            var form_data= new FormData(form[0]);
            $.ajax({
                type:form.attr('method'),
                url:form.attr('action'),
                data: form_data,
                processData: false,
                contentType: false,
                success:function (data) {
                  that.response="Success !!"
                },
                error: function (data) {
                  that.response=JSON.stringify(data)
                }
            });
            ev.preventDefault();
        });
    },
  computed:{
      
    },
  methods: {
    send: function () {
      var that = this
      
    }
  }
})