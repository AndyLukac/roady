class AddCoordinatesToAccommodations < ActiveRecord::Migration[5.2]
  def change
    add_column :journey_items, :latitude, :float
    add_column :journey_items, :longitude, :float
  end
end
