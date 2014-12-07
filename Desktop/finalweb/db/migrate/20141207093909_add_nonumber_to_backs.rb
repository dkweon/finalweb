class AddNonumberToBacks < ActiveRecord::Migration
  def change
    change_table :backs do |t|
      t.string :number
    end
  end
end
