# == Schema Information
#
# Table name: documents_references
#
#  document_id  :integer
#  reference_id :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class DocumentsReference < ActiveRecord::Base
  belongs_to :document
  belongs_to :reference
end
