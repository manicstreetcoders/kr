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

  has_attached_file :avatar, :styles => { :thumb => "200x200>" }

  has_many :reports
end
