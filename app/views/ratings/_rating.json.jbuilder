json.extract! rating, :id, :stars, :comment, :user_id, :item_id, :created_at, :updated_at
json.url rating_url(rating, format: :json)
