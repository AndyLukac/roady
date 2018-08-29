class ChangeDepartureAndArrivalStringToDates < ActiveRecord::Migration[5.2]
  def change
    remove_column :journey_items, :arrival_date
    add_column :journey_items, :arrival_date, :datetime

    remove_column :journey_items, :departure_date
    add_column :journey_items, :departure_date, :datetime
  end
end
