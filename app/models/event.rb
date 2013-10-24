class Event < ActiveRecord::Base
  ActiveRecord::Base.include_root_in_json = true
  attr_accessible :airTemp, :amount, :latitude, :length, :longitude, :name, :thumbnail, :id, :updated_at, :created_at, :user_id
  belongs_to :user

end
