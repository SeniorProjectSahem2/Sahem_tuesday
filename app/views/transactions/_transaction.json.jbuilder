json.extract! transaction, :id, :date_created, :item_name, :borrower_id, :lender_id, :item_id, :rental_id, :created_at, :updated_at
json.url transaction_url(transaction, format: :json)
