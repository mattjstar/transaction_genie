# == Schema Information
#
# Table name: parcels
#
#  id                  :integer          not null, primary key
#  borough             :integer
#  block               :string           not null
#  lot                 :string           not null
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

require 'rails_helper'

RSpec.describe Parcel, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
