require 'json'
class ProcessJsonMessage

  def initialize(raw_text)
    @raw_text=raw_text
    @message=Message.new(raw_content: @raw_text)

    if h=parse_content
      @message.assign_attributes(
        uuid: h['event_uuid'],
        event_name: h['event_name'],
        published_at: h['event_creation_time'].to_datetime,
        sender_id: h['event_sender_id'],
        data: h['data'],
      )
    end
    @message.save
  end

  def parse_content
    begin
      return JSON.parse(@raw_text)
    rescue JSON::ParserError => e
      return nil
    end
  end
end