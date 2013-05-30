class AddFieldsToProduct < ActiveRecord::Migration
  def change
    add_column :products, :title, :string
    add_column :products, :inventory_id, :integer
    add_column :products, :subject, :string
    add_column :products, :author, :string
    add_column :products, :url, :string
    add_column :products, :isbn, :string
    remove_column :products, :name 
  end
end
