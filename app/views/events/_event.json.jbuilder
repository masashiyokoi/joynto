json.extract! event, :id, :name, :detail, :start_at, :end_at, :created_at, :updated_at
json.url event_url(event, format: :json)
