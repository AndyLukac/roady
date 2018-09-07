class AddGoFlightNumberToJourneyItems < ActiveRecord::Migration[5.2]
  def change
    add_column :journey_items, :go_flight_number, :string
  end
end
