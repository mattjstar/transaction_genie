class CreateDocumentsReferences < ActiveRecord::Migration
  def change
    create_table :documents_references, id: false do |t|
      t.belongs_to :document, index: true
      t.belongs_to :reference, index: true
      t.timestamps null: false
    end
  end
end
