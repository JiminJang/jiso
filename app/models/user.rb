class User < ActiveRecord::Base
  rolify
  include Authority::UserAbilities
  after_create :assign_default_role
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  has_many :tipposts, dependent: :destroy
  has_many :communities, dependent: :destroy
  has_many :tipcomments, dependent: :destroy
  has_many :comcoms, dependent: :destroy
  has_many :albas, dependent: :destroy
  has_many :albacoms, dependent: :destroy
  has_many :compliments, dependent: :destroy
  has_many :likes
  has_many :brands, dependent: :destroy
  
  mount_uploader :avatar, AvatarUploader
  
  def is_like?(post)
    Like.find_by(user_id: self.id, post_id: post.id).present?
  end
  def assign_default_role
    
    add_role(:user) if self.roles.blank?
  end

end
