class ProductAttributeTypeVariationsController < InheritedResources::Base

  # GET /product_attribute_type_variations/1
  # GET /product_attribute_type_variations/1.json
  def show
    @product_attribute_type_variation = ProductAttributeTypeVariation.find(params[:id])

    puts @product_attribute_type_variation.to_yaml
    puts '33333333333333333333333333333333333333333333333333333333'
    @product_attribute_type_variation_values = @product_attribute_type_variation.product_attribute_type_variation_values

    puts @product_attribute_type_variation.id
    puts '||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||'
    puts '||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||'
    puts '||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||'
    puts '||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||'
    puts '||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||'
    puts '||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||'
    puts @product_attribute_type_variation_values.to_yaml
    puts '||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||'
    puts '||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||'


    @product_attribute_type_variation_value = ProductAttributeTypeVariationValue.new

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @company }
    end
  end

end
