class CreateClients < ActiveRecord::Migration[8.1]
  def change
    create_table :clients, id: :uuid do |t|
      t.string :name
      t.boolean :active
      t.references type: :uuid, foreign_key: true

      t.timestamps
    end
  end
end
