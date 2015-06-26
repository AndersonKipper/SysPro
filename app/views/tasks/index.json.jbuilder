json.array!(@tasks) do |task|
  json.extract! task, :id, :nome, :description, :dateStart, :dateEnd, :stats, :project_id, :user_email
  json.url task_url(task, format: :json)
end
