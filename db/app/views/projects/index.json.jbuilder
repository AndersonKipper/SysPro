json.array!(@projects) do |project|
  json.extract! project, :id, :nome, :description, :date, :user_id, :stats
  json.url project_url(project, format: :json)
end
