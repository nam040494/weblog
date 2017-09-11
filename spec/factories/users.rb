FactoryGirl.define do
  factory :user do
    name "MyString"
    email "MyString"
    password "MyString"
    phone "MyString"
    sex "MyString"
    birth_day Time.now
  end
end
