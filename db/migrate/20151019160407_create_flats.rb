class CreateFlats < ActiveRecord::Migration
  def change
    create_table :flats do |t|
      t.string :name
      t.integer :capacity
      t.string :city
      t.string :street
      t.string :zip_code
      t.text :description
      t.integer :price
      # t.references :user, index: true, foreign_key: true

      t.integer :owner_id, index: true

      t.timestamps null: false
    end

    add_foreign_key :flats, :users, column: :owner_id
  end
end
