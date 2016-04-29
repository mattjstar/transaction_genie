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

class Document < ActiveRecord::Base
  has_many :documents_parcels, join_table: :documents_parcels
  has_many :parcels, through: :documents_parcels

  has_many :documents_parties, join_table: :documents_parties
  has_many :parties, through: :documents_parties

  has_many :documents_references, join_table: :documents_references
  has_many :references, through: :documents_references
end
