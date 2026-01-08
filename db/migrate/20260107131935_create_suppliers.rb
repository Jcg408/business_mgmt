class CreateSuppliers < ActiveRecord::Migration[8.1]
  def change
    create_table :suppliers, id: :uuid do |t|
      t.string :name
      t.string :email
      t.text :contact

      t.timestamps
    end
  end
end
