class Message < ApplicationRecord
  after_create_commit do |variable|
    message_html= MessagesController.render partial: 'messages/message_row', locals: {message: self}
    ActionCable.server.broadcast "rabbitmq_activity_channel" ,message: message_html
  end
end
