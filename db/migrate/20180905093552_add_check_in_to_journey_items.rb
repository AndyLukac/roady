class AddCheckInToJourneyItems < ActiveRecord::Migration[5.2]
  def change
    add_column :journey_items, :check_in, :string
  end
end
