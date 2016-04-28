class RenameDocumentIdToDocumentIdNum < ActiveRecord::Migration
  def change
    remove_index :documents, :document_id
    rename_column :documents, :document_id, :document_id_num
    change_column :documents, :document_id_num, :string, null: false
    add_index :documents, :document_id_num, unique: true
  end
end
