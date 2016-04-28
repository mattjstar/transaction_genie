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

FactoryGirl.define do
  factory :reference do
    crfn "MyString"
    document_id_num "MyString"
    borough 1
    year "MyString"
    reel "MyString"
    page "MyString"
    file_num "MyString"
  end
end
