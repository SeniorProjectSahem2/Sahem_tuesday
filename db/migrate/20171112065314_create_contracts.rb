class CreateContracts < ActiveRecord::Migration
  def change
    create_table :contracts do |t|
      t.references :rental, index: true, foreign_key: true
      t.float :amount
      t.string :status

      t.timestamps null: false
    end
  end
end
