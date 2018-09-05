class AddTelephoneToJourneyItems < ActiveRecord::Migration[5.2]
  def change
    add_column :journey_items, :telephone, :string
  end
end
