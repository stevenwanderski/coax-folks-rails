class CreateSettings < ActiveRecord::Migration
  def change
    create_table :settings do |t|
      t.string :home_image
      t.string :home_video
      t.string :track
      t.text :copy

      t.timestamps null: false
    end

    Setting.new.save!
  end
end
