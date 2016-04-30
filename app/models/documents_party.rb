# == Schema Information
#
# Table name: documents_parties
#
#  document_id :integer
#  party_id    :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  party_level :integer
#  id          :integer          not null, primary key
#

class DocumentsParty < ActiveRecord::Base
  belongs_to :document
  belongs_to :party

  def self.update_level(document_id, party_id, party_level)
    dp = self.find_by(document_id: document_id, party_id: party_id)
    dp.update(party_level: party_level) if dp
    return dp
  end
end
