class CreateFeeds < ActiveRecord::Migration
  def change
    create_table :feeds do |t|
      t.string :search_term
      t.text :results
    end
  end
end
