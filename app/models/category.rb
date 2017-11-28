class Category < ActiveRecord::Base
    has_many :items
    scope :all_items,      ->(category_id) { Item.where("category_id = ?", category_id) }
end
