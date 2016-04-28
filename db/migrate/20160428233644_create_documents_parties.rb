class CreateDocumentsParties < ActiveRecord::Migration
  def change
    create_table :documents_parties, id: false do |t|
      t.belongs_to :document, index: true
      t.belongs_to :party, index: true
      t.integer :document_level, index: true
      t.timestamps null: false
    end
  end
end
