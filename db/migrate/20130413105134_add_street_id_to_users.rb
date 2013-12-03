class AddStreetIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :street_id, :integer
  end

end