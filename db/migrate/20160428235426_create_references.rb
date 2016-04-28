class CreateReferences < ActiveRecord::Migration
  def change
    create_table :references do |t|
      t.string :crfn
      t.string :document_id_num
      t.integer :borough
      t.string :year
      t.string :reel
      t.string :page
      t.string :file_num

      t.timestamps null: false
    end
  end
end
