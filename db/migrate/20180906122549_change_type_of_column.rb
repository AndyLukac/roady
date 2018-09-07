class ChangeTypeOfColumn < ActiveRecord::Migration[5.2]
  def change
    change_column :journey_items, :price, :string
  end
end
