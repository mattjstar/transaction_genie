class CreateDocumentsParcels < ActiveRecord::Migration
  def change
    create_table :documents_parcels, id: false do |t|
      t.belongs_to :document, index: true
      t.belongs_to :parcel, index: true
      t.timestamps null: false
    end
  end
end
