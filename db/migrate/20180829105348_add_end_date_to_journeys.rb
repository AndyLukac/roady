class AddEndDateToJourneys < ActiveRecord::Migration[5.2]
  def change
    add_column :journeys, :end_date, :string
  end
end
