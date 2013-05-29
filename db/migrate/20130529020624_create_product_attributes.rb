class CreateProductAttributes < ActiveRecord::Migration
  def change
    create_table :product_attributes do |t|
      t.integer :product_id
      t.integer :product_attribute_type_id
      t.string :value

      t.timestamps
    end
  end
end
