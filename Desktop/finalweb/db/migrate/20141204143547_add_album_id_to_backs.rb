class AddAlbumIdToBacks < ActiveRecord::Migration
  def change
    change_table :backs do |t|
      t.integer :album_id
    end
  end
end
