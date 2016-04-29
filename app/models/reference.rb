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

class Reference < ActiveRecord::Base
  has_many :documents_references, join_table: :documents_references
  has_many :documents, through: :documents_references
end
