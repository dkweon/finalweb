# db/migrate/20141126185756_create_albums.rb
class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :name
      t.string :picture
    end
  end
end
