FactoryGirl.define do
  factory :parcel do
    borough 1
    sequence :block do |i|
      "Block #{i}"
    end
    lot ""
  end
end
