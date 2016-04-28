class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.string :document_id
      t.string :crfn
      t.string :collateral
      t.integer :num_pages
      t.string :reel_page
      t.date :expiration_date
      t.string :doc_type
      t.string :file_num
      t.date :assessment_date
      t.date :doc_date
      t.time :recorded_filed
      t.string :slid_num
      t.decimal :doc_amount
      t.integer :borough
      t.decimal :percent_transferred
      t.string :rptt_num
      t.string :map_sequence_num
      t.string :message
      t.text :remarks

      t.timestamps null: false
    end

    add_index :documents, :document_id
  end
end
