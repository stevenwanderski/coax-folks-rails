class CreateSettings < ActiveRecord::Migration
  def change
    create_table :settings do |t|
      t.text :track
      t.text :copy
      t.text :images

      t.timestamps null: false
    end

    Setting.new.save!
  end
end
