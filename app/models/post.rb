class Post < ApplicationRecord
  belongs_to :user
  has_many :taggings
  has_many :tags, through: :taggings
  has_many :comments, dependent: :destroy

  validates :title, presence: true
  validates :content, presence: true, length: {maximum: Settings.post.content.maximum}
end
