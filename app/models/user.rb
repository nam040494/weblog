class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable,
    :omniauthable, omniauth_providers: [:facebook, :google_oauth2]

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :active_relationships, class_name: Relationship.name,
    foreign_key: :follower_id, dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :passive_relationships, class_name: "Relationship",
    foreign_key: "followed_id", dependent: :destroy
  has_many :followers, through: :passive_relationships, source: :follower
  has_attached_file :avatar, styles: {medium: "300x300>", thumb: "100x100#"},
    default_url: Settings.users.avatar

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :name, presence: true,
    length: {maximum: Settings.validates.name.maximum}
  validates :email, presence: true,
    length: {maximum: Settings.validates.email.maximum},
    format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}
  validates :password, presence: true,
    length: {minimum: Settings.validates.password.minimum}, allow_nil: true
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  class << self
    def from_omniauth access_token
      data = access_token.info
      user = User.where(email: data["email"]).first

      unless user
        password = Devise.friendly_token[0,20]
        user = User.new name: data["name"], email: data["email"],
          password: password, password_confirmation: password
        user.avatar_from_url data[:image]
        user.save
      end
      user
    end
  end

  def follow other
    following << other
  end

  def unfollow other
    following.delete other
  end

  def following? other
    following.include? other
  end

  def avatar_from_url url
    self.avatar = open url
  end
end
