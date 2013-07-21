class ProductAttributeTypeVariationValue < ActiveRecord::Base
  attr_accessible :product_attribute_type_variation_id, :value

  belongs_to :product_attribute_type_variation

  def keywords
  end


end
