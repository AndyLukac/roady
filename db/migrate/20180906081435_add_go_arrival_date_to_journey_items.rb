class AddGoArrivalDateToJourneyItems < ActiveRecord::Migration[5.2]
  def change
    add_column :journey_items, :go_arrival_date, :string
  end
end
