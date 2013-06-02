class AddProductAttributeTypeVariationValueIdToProductAttributeTypeVariation < ActiveRecord::Migration
  def change
    add_column :product_attribute_type_variations, :product_attribute_type_variation_value_id, :integer
  end
end
