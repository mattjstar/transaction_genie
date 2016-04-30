# == Schema Information
#
# Table name: parcels
#
#  id                  :integer          not null, primary key
#  borough             :integer
#  block               :integer
#  lot                 :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  bbl                 :string           not null
#  partial             :string
#  property_type       :string
#  easement            :boolean
#  air_rights          :boolean
#  subterranean_rights :boolean
#  property_address    :string
#  unit                :string
#  remarks             :text
#

FactoryGirl.define do
  factory :parcel do
    borough 1
    sequence :block do |i|
      "Block #{i}"
    end
    lot ""
  end
end
