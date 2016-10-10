class Event < ApplicationRecord

  class DefinitionConflict < StandardError; end

  has_many :messages, dependent: :destroy
  has_many :event_errors, dependent: :destroy

  def self.verify_or_create(h)
    if event=self.find_by(uuid: h[:uuid])
      h.each do |k,v|
        old_value=event[k]
        raise DefinitionConflict.new("Conflit sur la cle #{k} : #{old_value} => #{v}") unless old_value==v
      end
      event
    else
      self.create(h)
    end
  end

  def send_refresh_event
    message_html= EventsController.render( partial: 'events/event', formats: :json, handlers: :jbuilder, locals: { event: self})
    ActionCable.server.broadcast "rabbitmq_activity_channel" ,message: JSON.parse(message_html)
  end

  def notify_error_change
    self.touch
  end

  after_commit do |variable|
    self.send_refresh_event
  end

end
