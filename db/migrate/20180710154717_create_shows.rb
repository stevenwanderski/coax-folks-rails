class CreateShows < ActiveRecord::Migration
  def change
    create_table :shows do |t|
      t.date :date
      t.string :time
      t.string :band_type
      t.string :band_name
      t.string :venue_name
      t.text :description

      t.timestamps null: false
    end
  end
end
