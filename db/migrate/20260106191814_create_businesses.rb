class CreateBusinesses < ActiveRecord::Migration[8.1]
  def change
    create_table :businesses, id: :uuid do |t|
      t.string :name
      t.boolean :active
      t.timestamps
    end
  end
end
