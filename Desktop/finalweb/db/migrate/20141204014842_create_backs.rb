class CreateBacks < ActiveRecord::Migration
  #user's background picture database

  def change
    create_table :backs do |t|
      t.string :back_album
    end
  end
end
