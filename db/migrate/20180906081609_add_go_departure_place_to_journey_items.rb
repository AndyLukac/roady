class AddGoDeparturePlaceToJourneyItems < ActiveRecord::Migration[5.2]
  def change
    add_column :journey_items, :go_departure_place, :string
  end
end
