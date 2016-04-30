class AddIndexesToParcels < ActiveRecord::Migration
  def change
    add_index :parcels, [:borough, :block]
    add_index :parcels, :borough
  end
end
