class AddReturnDeparturePlaceToJourneyItems < ActiveRecord::Migration[5.2]
  def change
    add_column :journey_items, :return_departure_place, :string
  end
end
