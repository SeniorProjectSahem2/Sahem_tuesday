class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.text :description
      t.string :size
      t.float :weight
      t.integer :quantity
      t.float :daily_price
      t.float :weekly_price
      t.float :monthly_price
      t.references :user, index: true, foreign_key: true
      t.references :category, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
