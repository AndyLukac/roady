class AddReturnArrivalDateToJourneyItems < ActiveRecord::Migration[5.2]
  def change
    add_column :journey_items, :return_arrival_date, :string
  end
end
