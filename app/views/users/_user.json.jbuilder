json.extract! user, :id, :first_name, :last_name, :location_id, :user_type_id, :created_at, :updated_at
json.url user_url(user, format: :json)
