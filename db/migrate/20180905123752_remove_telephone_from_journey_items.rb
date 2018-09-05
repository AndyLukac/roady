class RemoveTelephoneFromJourneyItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :journey_items, :telephone, :integer
  end
end
