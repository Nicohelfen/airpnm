class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.date :check_in
      t.date :check_out
      t.string :status
      t.references :flat, index: true, foreign_key: true
      t.integer :guest_id, index: true

      t.timestamps null: false
    end

    add_foreign_key :bookings, :users,  column: :guest_id

  end
end
