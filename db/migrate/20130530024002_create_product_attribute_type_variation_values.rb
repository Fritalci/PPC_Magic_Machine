class CreateProductAttributeTypeVariationValues < ActiveRecord::Migration
  def change
    create_table :product_attribute_type_variation_values do |t|
      t.integer :product_attribute_type_variation_id
      t.string :value

      t.timestamps
    end
  end
end
