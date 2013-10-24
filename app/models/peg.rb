class Peg < ActiveRecord::Base
  ActiveRecord::Base.include_root_in_json = true

  attr_accessible :action, :code, :fp_id, :title, :first_name, :middle_name, :last_name, :link, :note, :place, :id, :updated_at, :created_at, :user_id, :palace_id
  belongs_to :palace

  def full_name
    [title, first_name, middle_name, last_name].join(" ")
  end

end
