class AddCommentToRentals < ActiveRecord::Migration
  def change
    add_column :rentals, :comment, :text
  end
end
