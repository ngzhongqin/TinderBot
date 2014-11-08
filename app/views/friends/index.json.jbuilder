json.array!(@friends) do |friend|
  json.extract! friend, :id, :friend, :user_id
  json.url friend_url(friend, format: :json)
end
