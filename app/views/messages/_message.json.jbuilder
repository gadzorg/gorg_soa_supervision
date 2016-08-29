json.extract! message, :id, :raw_content, :uuid, :event_name, :published_at, :sender_id, :data, :created_at, :updated_at
json.url message_url(message, format: :json)