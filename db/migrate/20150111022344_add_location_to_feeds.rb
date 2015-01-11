class AddLocationToFeeds < ActiveRecord::Migration
  def change
    add_column :feeds, :location, :string
  end
end
