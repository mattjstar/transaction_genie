class ChangeBblToStringOnParcels < ActiveRecord::Migration
  def change
    change_column :parcels, :bbl, :string
  end
end
