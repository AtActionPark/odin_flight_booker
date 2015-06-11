class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.string :number
      t.references :flight

      t.timestamps null: false
    end
  end
end