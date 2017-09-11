require "rails_helper"

RSpec.describe Comment, type: :model do
  describe Comment do
    it {should belong_to(:post)}
  end
end
