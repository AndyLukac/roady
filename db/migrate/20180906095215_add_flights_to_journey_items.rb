class AddFlightsToJourneyItems < ActiveRecord::Migration[5.2]
  def change
    add_column :journey_items, :flights, :text
  end
end
