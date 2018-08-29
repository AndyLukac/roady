class RemoveDateFromJourneys < ActiveRecord::Migration[5.2]
  def change
    remove_column :journeys, :date, :string
  end
end
