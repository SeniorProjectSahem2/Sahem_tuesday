class AddQuantityToRentals < ActiveRecord::Migration
  def change
    add_column :rentals, :quantity, :integer
  end
end
