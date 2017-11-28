class RemoveDateCreatedFromTransaction < ActiveRecord::Migration
  def change
    remove_column :transactions, :date_created, :date
  end
end
