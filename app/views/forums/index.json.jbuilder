json.array!(@forums) do |forum|
  json.extract! forum, :id, :project_id, :user_id, :name_user, :message, :data
  json.url forum_url(forum, format: :json)
end
