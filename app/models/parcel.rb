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

class Parcel < ActiveRecord::Base
  has_many :documents_parcels, join_table: :documents_parcels
  has_many :documents, through: :documents_parcels

  validates_presence_of :bbl, :borough, :block, :lot
end
