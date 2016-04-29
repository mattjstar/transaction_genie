# == Schema Information
#
# Table name: documents
#
#  id                  :integer          not null, primary key
#  document_id_num     :string           not null
#  crfn                :string
#  collateral          :string
#  num_pages           :integer
#  reel_page           :string
#  expiration_date     :date
#  doc_type            :string
#  file_num            :string
#  assessment_date     :date
#  doc_date            :date
#  slid_num            :string
#  doc_amount          :decimal(, )
#  borough             :integer
#  percent_transferred :decimal(, )
#  rptt_num            :string
#  map_sequence_num    :string
#  message             :string
#  remarks             :text
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  recorded_filed_at   :datetime
#

require 'rails_helper'

RSpec.describe Document, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
