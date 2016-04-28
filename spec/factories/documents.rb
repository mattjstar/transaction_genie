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
#  recorded_filed      :time
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
#

FactoryGirl.define do
  factory :document do
    document_id "MyString"
    crfn "MyString"
    collateral "MyString"
    num_pages 1
    reel_page "MyString"
    expiration_date "2016-04-28"
    doc_type "MyString"
    file_num "MyString"
    assessment_date "2016-04-28"
    doc_date "2016-04-28"
    recorded_filed "2016-04-28 19:15:58"
    slid_num "MyString"
    doc_amount "9.99"
    borough 1
    percent_transferred "9.99"
    rptt_num "MyString"
    map_sequence_num "MyString"
    message "MyString"
  end
end
