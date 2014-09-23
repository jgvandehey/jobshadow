class AddItemsToOpenings < ActiveRecord::Migration
  def change
  	add_column :openings, :title, :string
  	add_column :openings, :company, :string
  	add_column :openings, :position, :string
  	add_column :openings, :location, :string
  	add_column :openings, :description, :text
  	add_column :openings, :availability, :string
  	add_column :openings, :open, :boolean, :default => true
  end
end
