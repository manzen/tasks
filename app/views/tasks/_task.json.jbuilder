json.extract! task, :id, :name, :deadline, :work_time, :state, :implementation_scheduled_date, :complete_scheduled_date, :created_at, :updated_at
json.url task_url(task, format: :json)
