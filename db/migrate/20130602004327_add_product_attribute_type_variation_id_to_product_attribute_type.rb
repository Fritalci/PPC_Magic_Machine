class AddProductAttributeTypeVariationIdToProductAttributeType < ActiveRecord::Migration
  def change
    add_column :product_attribute_types, :product_attribute_type_variation_id, :integer
  end
end
