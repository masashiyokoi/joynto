json.extract! task, :id, :name, :scope, :category, :priority, :importance, :urgency, :status, :due_date, :created_at, :updated_at
json.url task_url(task, format: :json)
