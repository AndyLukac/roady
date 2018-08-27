class CreateJourneyItems < ActiveRecord::Migration[5.2]
  def change
    create_table :journey_items do |t|
      t.string :name
      t.string :owner
      t.string :address
      t.integer :guests
      t.integer :price
      t.integer :telephone
      t.string :flight_number
      t.string :reservation_number
      t.string :departure_date
      t.string :departure_place
      t.string :arrival_date
      t.string :arrival_place
      t.integer :hiring_days
      t.string :brand
      t.string :type
      t.references :journey, foreign_key: true
    end
  end
end
