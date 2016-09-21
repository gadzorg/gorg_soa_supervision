class MessageSenderController < ApplicationController
  def send_message
    message_params=params.require(:message).permit(:routing_key, :data, :sender)

    opts={}
    opts[:event_sender_id]= message_params[:sender] if message_params[:sender].present?
    begin
      data=JSON.parse(message_params[:data])

      sender=GorgMessageSender.new()
      message=sender.send_message(data,message_params[:routing_key],opts)
      render json: message
    rescue JSON::Schema::ValidationError => e
      render json: e.message, status: :unprocessable_entity
    rescue JSON::ParserError => e
      render json: "Invalid JSON data", status: :unprocessable_entity
    end
  end
end
