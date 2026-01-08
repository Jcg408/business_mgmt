class CreateServices < ActiveRecord::Migration[8.1]
  def change
    create_table :services, id: :uuid do |t|
      t.string :category
      t.references :business, polymorphic: true, type: :uuid

      t.timestamps
    end
  end
end
