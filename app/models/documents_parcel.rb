# == Schema Information
#
# Table name: documents_parcels
#
#  document_id :integer
#  parcel_id   :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class DocumentsParcel < ActiveRecord::Base
  belongs_to :document
  belongs_to :parcel
end
