class ProductAttributeTypeVariation < ActiveRecord::Base
  attr_accessible :name, :product_attribute_type_id

  belongs_to :product_attribute_type

  has_many :product_attribute_type_variation_values, :dependent => :nullify
end
