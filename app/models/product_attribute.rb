class ProductAttribute < ActiveRecord::Base
  attr_accessible :product_attribute_type_id, :product_id, :value, :product_attribute_type_variation_id

  belongs_to :product_attribute_type
  belongs_to :product
  belongs_to :product_attribute_type_variation
end
