class ChangeBlockAndLotToStringsOnParcels < ActiveRecord::Migration
  def change
    change_column :parcels, :lot, :string, null: false
    change_column :parcels, :block, :string, null: false
  end
end
