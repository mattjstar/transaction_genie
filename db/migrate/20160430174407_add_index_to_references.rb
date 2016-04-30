class AddIndexToReferences < ActiveRecord::Migration
  def change
    add_index :references, :crfn
    add_index :references, :document_id_num
    add_index :references, [:crfn, :document_id_num], unique: true
  end
end
