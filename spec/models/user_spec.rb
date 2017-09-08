require "rails_helper"

RSpec.describe User, type: :model do
  describe User do
    it {should has_many(:post)}
    it {should have_many(:comment)}
    it {should have_many(:relationship)}
  end
end
