class Micropost < ApplicationRecord
  validates :name, :youtube_url, :content, presence: true
  before_save :slugify
  belongs_to :user

  def slugify
    self.youtube_url = youtube_url.last(11)
  end
end
