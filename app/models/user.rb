class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :remember_me
  attr_accessible :avatar
  attr_accessible :password_confirmation
  # attr_accessible :title, :body

  has_attached_file :avatar, :style => { :medium => "300x300>", :thumb => "100x100>" }

  has_many :reports
end
