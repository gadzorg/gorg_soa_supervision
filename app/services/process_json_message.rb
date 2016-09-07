require 'json'
class ProcessJsonMessage

  def initialize(raw_text)
    @raw_text=raw_text
    @message=Message.new(raw_content: @raw_text)
    @message.save
    if h=parse_content
      @event=Event.verify_or_create(
        uuid: h['event_uuid'],
        event_name: h['event_name'],
        published_at: h['event_creation_time'].to_datetime,
        sender_id: h['event_sender_id'],
        data: h['data']
      )

      @message.event=@event
      @message.save

      
      h['errors'].to_a.each do |eh|
        error=EventError.verify_or_create(
            uuid: eh["error_uuid"],
            error_type: eh["error_type"],
            sender: eh["error_sender"],
            message: eh["error_message"],
            published_at: eh["timestamp"].to_datetime,
            debug_data: eh["error_debug"],
            event_id: @event.id
          )

        @message.event_errors<<error
      end
    end
  end

  def parse_content
    begin
      return JSON.parse(@raw_text)
    rescue JSON::ParserError => e
      return nil
    end
  end
end