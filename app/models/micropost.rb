class Micropost < ApplicationRecord
  paginates_per 12
  validates :name, :youtube_url, :content, presence: true
  before_save :slugify
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  def slugify
    self.youtube_url = youtube_url.last(11)
  end
end
