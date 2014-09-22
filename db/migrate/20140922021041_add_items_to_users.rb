class AddItemsToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :linkedin_url, :string
  	add_column :users, :company, :string
  	add_column :users, :location, :string
  	add_column :users, :industry, :string
  end
end
