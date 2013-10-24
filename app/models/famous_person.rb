class FamousPerson < ActiveRecord::Base
  ActiveRecord::Base.include_root_in_json = true
  attr_accessible :id, :code, :title, :first_name, :middle_name, :last_name, :link, :note

  self.per_page = 25


end
