class AddGoArrivalPlaceToJourneyItems < ActiveRecord::Migration[5.2]
  def change
    add_column :journey_items, :go_arrival_place, :string
  end
end
