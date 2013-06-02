class AddProductAttributeTypeVariationIdToProductAttributes < ActiveRecord::Migration
  def change
    add_column :product_attributes, :product_attribute_type_variation_id, :integer
  end
end
