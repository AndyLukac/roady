class AddImageToJourneyItems < ActiveRecord::Migration[5.2]
  def change
    add_column :journey_items, :image, :string
  end
end
