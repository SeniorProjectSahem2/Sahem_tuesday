json.extract! item, :id, :name, :description, :size, :weight, :quantity, :daily_price, :weekly_price, :monthly_price, :user_id, :category_id, :created_at, :updated_at
json.url item_url(item, format: :json)
