class Post < ActiveRecord::Base
  attr_accessible :content, :title, :user_id

  validates :title, :presence => true, :length => { :minimum => 3 }
  validates :content, :presence => true, :length => { :minimum => 3 }

  belongs_to :user

  default_scope :order => 'posts.id DESC'
end
