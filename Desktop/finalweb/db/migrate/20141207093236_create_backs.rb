class CreateBacks < ActiveRecord::Migration
  def change
    create_table :backs do |t|
      t.string :image
      t.integer :album_id
    end
  end
end
