class RemoveFlightNumberFromJourneyItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :journey_items, :flight_number, :string
  end
end
