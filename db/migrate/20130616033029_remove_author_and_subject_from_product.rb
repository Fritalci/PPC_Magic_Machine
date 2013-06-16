class RemoveAuthorAndSubjectFromProduct < ActiveRecord::Migration
  def up
    remove_column :products, :author 
    remove_column :products, :subject
  end

  def down
  	add_column :products, :author, :string 
  	add_column :products, :author, :string 
  end
end
