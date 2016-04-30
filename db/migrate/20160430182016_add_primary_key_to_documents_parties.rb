class AddPrimaryKeyToDocumentsParties < ActiveRecord::Migration
  def change
    add_column :documents_parties, :id, :primary_key
  end
end
