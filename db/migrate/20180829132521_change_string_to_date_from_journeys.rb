class ChangeStringToDateFromJourneys < ActiveRecord::Migration[5.2]
  def change
    remove_column :journeys, :start_date
    add_column :journeys, :start_date, :date

    remove_column :journeys, :end_date
    add_column :journeys, :end_date, :date
  end
end
