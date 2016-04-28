# == Schema Information
#
# Table name: parties
#
#  id         :integer          not null, primary key
#  name       :string
#  line1      :string
#  line2      :string
#  city       :string
#  state      :string
#  zip        :string
#  country    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Party, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
