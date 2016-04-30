class AddNameIndexToParties < ActiveRecord::Migration
  def change
    add_index :parties, :name
  end
end
