require "rails_helper"

RSpec.describe Tag, type: :model do
  describe Tag do
    it {should have_many(:taggings)}
    it {should have_many(:posts).through(:taggings)}
  end
end
