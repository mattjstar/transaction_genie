class RenameDocumentLevelToPartyLevelForDocumentsParties < ActiveRecord::Migration
  def change
    remove_index :documents_parties, :document_level
    remove_column :documents_parties, :document_level, :integer
    add_column :documents_parties, :party_level, :integer
    add_index :documents_parties, :party_level
  end
end
