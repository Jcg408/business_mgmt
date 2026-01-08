class CreateProducts < ActiveRecord::Migration[8.1]
  def change
    create_table :products, id: :uuid do |t|
      t.string :name
      t.text :usage
      t.integer :stock_quantity
       t.references :supplier, type: :uuid, foreign_key: true, null: true

      t.timestamps
    end
  end
end
