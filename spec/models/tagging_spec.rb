require "rails_helper"

RSpec.describe Tagging, type: :model do
  describe Tagging do
    it {should belong_to(:post)}
    it {should belong_to(:tag)}
  end
end
