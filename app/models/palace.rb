class Palace < ActiveRecord::Base
  ActiveRecord::Base.include_root_in_json = true
  attr_accessible :title, :ptype, :id, :updated_at, :created_at, :user_id, :peg_id

  belongs_to :user

  has_many :pegs, :order => 'created_at', :dependent => :destroy


end
