class CreateJourneys < ActiveRecord::Migration[5.2]
  def change
    create_table :journeys do |t|
      t.string :name
      t.string :date
      t.references :user, foreign_key: true
    end
  end
end
