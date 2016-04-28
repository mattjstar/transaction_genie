# == Schema Information
#
# Table name: references
#
#  id              :integer          not null, primary key
#  crfn            :string
#  document_id_num :string
#  borough         :integer
#  year            :string
#  reel            :string
#  page            :string
#  file_num        :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'rails_helper'

RSpec.describe Reference, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
