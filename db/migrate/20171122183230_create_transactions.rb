class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.date :date_created
      t.string :item_name
      t.integer :borrower_id
      t.integer :lender_id
      t.references :item, index: true, foreign_key: true
      t.references :rental, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
