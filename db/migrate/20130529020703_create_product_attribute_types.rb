class CreateProductAttributeTypes < ActiveRecord::Migration
  def change
    create_table :product_attribute_types do |t|
      t.string :name

      t.timestamps
    end
  end
end
