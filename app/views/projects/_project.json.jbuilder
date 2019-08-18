json.extract! project, :id, :title, :detail, :start_datetime, :end_datetime, :owner_id, :created_at, :updated_at
json.url project_url(project, format: :json)
