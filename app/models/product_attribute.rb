class ProductAttribute < ActiveRecord::Base
  attr_accessible :product_attribute_type_id, :product_id, :value
end
