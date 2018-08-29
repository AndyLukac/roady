class AddCoordinatesToJourneyItems < ActiveRecord::Migration[5.2]
  def change
    add_column :journey_items, :departure_longitude, :float
    add_column :journey_items, :departure_latitude, :float
    add_column :journey_items, :arrival_longitude, :float
    add_column :journey_items, :arrival_latitude, :float
  end
end
