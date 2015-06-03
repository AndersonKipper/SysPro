json.array!(@tasks) do |task|
  json.extract! task, :id, :nome, :description, :dateStart, :dateEnd, :stats, :projectId
  json.url task_url(task, format: :json)
end
