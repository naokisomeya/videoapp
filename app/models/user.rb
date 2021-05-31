class User < ApplicationRecord
  has_many :microposts, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :timeoutable, :trackable


 def self.guest
  find_or_create_by!(username: 'ゲストユーザー', email: 'guest@example.com') do |user|
    user.password = SecureRandom.urlsafe_base64
    user.confirmed_at = Time.now
  end
 end
 
end
