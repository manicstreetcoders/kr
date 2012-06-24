class Report < ActiveRecord::Base
  attr_accessible :title

  belongs_to :user

  has_attached_file :document

end
