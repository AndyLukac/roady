class AddReturnDepartureDateToJourneyItems < ActiveRecord::Migration[5.2]
  def change
    add_column :journey_items, :return_departure_date, :string
  end
end
