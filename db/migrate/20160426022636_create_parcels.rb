class CreateParcels < ActiveRecord::Migration
  def change
    create_table :parcels do |t|
      t.integer :borough
      t.integer :block
      t.integer :lot

      t.timestamps null: false
    end
	add_index :parcels, [ :borough, :block, :lot ], unique: true, name: 'index_parcels_on_borough_block_and_lot'
  end
end
