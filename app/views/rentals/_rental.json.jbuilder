json.extract! rental, :id, :start_date, :end_date, :status, :user_id, :item_id, :created_at, :updated_at
json.url rental_url(rental, format: :json)
