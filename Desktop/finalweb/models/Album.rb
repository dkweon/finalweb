class Album < ActiveRecord::Base
  has_and_belongs_to_many :users
  has_many :photos
  has_many :backs

end
