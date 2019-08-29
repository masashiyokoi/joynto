json.extract! event, :id, :caption, :detail, :url, :project_id, :owner_id, :start_datetime, :end_datetime, :created_at, :updated_at
json.url event_url(event, format: :json)
