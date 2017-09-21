class Identity < ApplicationRecord
  belongs_to :user
  validates :uid, scope: :provider, presence: true
  validates :uid, scope: :provider, uniqueness: true

  class << self
    def find_for_oauth auth
      find_or_create_by uid: auth.uid, provider: auth.provider
    end
  end
end
