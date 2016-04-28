# == Schema Information
#
# Table name: parties
#
#  id         :integer          not null, primary key
#  name       :string
#  line1      :string
#  line2      :string
#  city       :string
#  state      :string
#  zip        :string
#  country    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :party do
    name "MyString"
    line1 "MyString"
    line2 "MyString"
    city "MyString"
    state "MyString"
    zip "MyString"
    country "MyString"
  end
end
