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
#  bbl                 :integer          not null
#  partial             :string
#  property_type       :string
#  easement            :boolean
#  air_rights          :boolean
#  subterranean_rights :boolean
#  property_address    :string
#  unit                :string
#  remarks             :text
#

class Parcel < ActiveRecord::Base
  validates_presence_of :bbl, :borough, :block, :lot
end
