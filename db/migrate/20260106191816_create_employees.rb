class CreateEmployees < ActiveRecord::Migration[8.1]
  def change
    create_table :employees, id: :uuid do |t|
      t.string :name
      t.text :bio
      t.references :business, type: :uuid, foreign_key: true

      t.timestamps
    end
  end
end
