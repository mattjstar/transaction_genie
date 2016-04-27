class AddFieldsToParcels < ActiveRecord::Migration
  def change
    add_column :parcels, :bbl, :integer, null: false
    add_column :parcels, :partial, :string
    add_column :parcels, :property_type, :string
    add_column :parcels, :easement, :boolean
    add_column :parcels, :air_rights, :boolean
    add_column :parcels, :subterranean_rights, :boolean
    add_column :parcels, :property_address, :string
    add_column :parcels, :unit, :string
    add_column :parcels, :remarks, :text

    add_index :parcels, :bbl, unique: true
  end
end
