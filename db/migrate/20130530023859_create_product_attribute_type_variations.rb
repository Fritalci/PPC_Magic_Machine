class CreateProductAttributeTypeVariations < ActiveRecord::Migration
  def change
    create_table :product_attribute_type_variations do |t|
      t.integer :product_attribute_type_id
      t.string :name

      t.timestamps
    end
  end
end
