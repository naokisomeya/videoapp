class User < ApplicationRecord
  has_many :microposts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_microposts, through: :likes, source: :micropost
  has_many :comments, dependent: :destroy

  validates :username, presence: true
  validates :password, presence: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :timeoutable, :trackable

  def self.guest
    find_or_create_by!(username: 'ゲストユーザー', email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.confirmed_at = Time.now
    end
  end

  def already_liked?(micropost)
    likes.exists?(micropost_id: micropost.id)
  end
end
