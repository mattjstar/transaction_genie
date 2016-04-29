class ChangeTimeToDatetimeOnDocuments < ActiveRecord::Migration
  def change
    remove_column :documents, :recorded_filed
    add_column :documents, :recorded_filed_at, :datetime
  end
end
