class AddReturnArrivalPlaceToJourneyItems < ActiveRecord::Migration[5.2]
  def change
    add_column :journey_items, :return_arrival_place, :string
  end
end
