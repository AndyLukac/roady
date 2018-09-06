class AddCheckOutToJourneyItems < ActiveRecord::Migration[5.2]
  def change
    add_column :journey_items, :check_out, :string
  end
end
