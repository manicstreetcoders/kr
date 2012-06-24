class Report < ActiveRecord::Base
  attr_accessible :title, :document

  belongs_to :user

  has_attached_file :document

  validates :title, :presence => true, :length => { :minimum => 2 }

  validates_attachment :document, :presence => true,
    :size => { :in => 0..9999.kilobytes }
end
