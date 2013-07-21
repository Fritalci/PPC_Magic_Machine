class AddTypeIdToProductAttributeType < ActiveRecord::Migration
  def change
    add_column :product_attribute_types, :type_id, :integer
  end
end
