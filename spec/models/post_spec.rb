require "rails_helper"

RSpec.describe Post, type: :model do
  describe Post do
    it {should belong_to(:user)}
    it {should have_many(:tags).through(:taggings)}
    it {should have_many(:comments)}
  end
end
