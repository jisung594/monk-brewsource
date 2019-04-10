class CreateBreweries < ActiveRecord::Migration[5.2]
  def change
    create_table :breweries do |t|
      t.string :name
      t.string :image
      t.string :city
      t.string :state
      t.string :country
      t.integer :beer_count
      t.timestamps
    end
  end
end
