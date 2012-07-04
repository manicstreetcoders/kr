class Report < ActiveRecord::Base
  attr_accessible :title, :document, :tag_list

  belongs_to :user

  has_attached_file :document

  acts_as_ordered_taggable

  validates :title, :presence => true, :length => { :minimum => 2 }

  validates_attachment :document, :presence => true,
    :size => { :in => 0..9999.kilobytes }

  default_scope :order => 'reports.id DESC'

  def self.text_search( query )
    if query.present?
      where("title like :q", q: "%#{query}%")
    else
      scoped
    end
  end
end
