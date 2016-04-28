# == Schema Information
#
# Table name: documents_parties
#
#  document_id    :integer
#  party_id       :integer
#  document_level :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class DocumentsParty < ActiveRecord::Base
  belongs_to :document
  belongs_to :party
end
