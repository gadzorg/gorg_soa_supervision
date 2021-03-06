class RabbitmqActivityBroadcastJob < ApplicationJob
  queue_as :default

  def perform(message)
    Rails.logger.info "Perform job !"
    ActionCable.server.broadcast "rabbitmq_activity_channel" ,message: render_message(message)
  end
  
  private

  def render_message(message)
    MessagesController.render partial: 'messages/message_row', locals: {message: message}
  end
end