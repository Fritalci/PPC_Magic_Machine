class RemoveProductAttributeTypeVariationValueIdFromProductAttributeTypeVariations < ActiveRecord::Migration
  def up
    remove_column :product_attribute_type_variations, :product_attribute_type_variation_value_id
  end

  def down
    add_column :product_attribute_type_variations, :product_attribute_type_variation_value_id, :integer
  end
end
