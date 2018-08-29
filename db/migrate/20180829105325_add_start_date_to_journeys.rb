class AddStartDateToJourneys < ActiveRecord::Migration[5.2]
  def change
    add_column :journeys, :start_date, :string
  end
end
