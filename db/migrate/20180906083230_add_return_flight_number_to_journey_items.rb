class AddReturnFlightNumberToJourneyItems < ActiveRecord::Migration[5.2]
  def change
    add_column :journey_items, :return_flight_number, :string
  end
end
