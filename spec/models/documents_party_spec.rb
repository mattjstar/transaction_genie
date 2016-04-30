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

require 'rails_helper'

RSpec.describe DocumentsParty, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
