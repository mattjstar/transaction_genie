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

class Party < ActiveRecord::Base
  has_many :documents_parties, join_table: :documents_parties
  has_many :documents, through: :documents_parties
end
