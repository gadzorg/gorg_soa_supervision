json.extract! event, :id, :uuid, :event_name, :published_at, :sender_id, :data, :created_at, :created_at, :updated_at, :event_errors
json.url event_url(event, format: :json)