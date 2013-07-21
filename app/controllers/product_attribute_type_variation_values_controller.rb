class ProductAttributeTypeVariationValuesController < InheritedResources::Base


  # GET /products/new
  # GET /products/new.json
  def new
    @product_attribute_type_variation_value = ProductAttributeTypeVariationValue.new
    @product_attribute_type_variations = ProductAttributeTypeVariation.all

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @product_attribute_type_variation_value }
    end
  end

  def create
  	puts ''
  	puts ''
  	puts ''
  	puts '' 
  	puts ''
  	puts '____________________________________________'
  	puts params.to_yaml
  	puts '____________________________________________'
    puts params[:product_attribute_type_variation_value][:product_id]
  	puts ''
  	puts ''
  	puts ''
  	puts '' 
  	puts '' 
  	puts '' 
  	puts ''

    has_product_id = true
    has_product_id = false if params[:product_attribute_type_variation_value][:product_id].blank?
    @product = Product.find params[:product_attribute_type_variation_value][:product_id] if has_product_id

    @product_attribute_type_variation_value = ProductAttributeTypeVariationValue.new value: params[:product_attribute_type_variation_value][:value], product_attribute_type_variation_id: params[:product_attribute_type_variation_value][:product_attribute_type_variation_id]

    if @product_attribute_type_variation_value.product_attribute_type_variation_id == 0 #need to create a new one
      @product_attribute_type_variation = ProductAttributeTypeVariation.new product_attribute_type_id: params[:product_attribute_type_variation_value][:product_attribute_type_id], name: @product.title.to_s + ' ' + params[:product_attribute_type_variation_value][:product_attribute_type_name]
      @product_attribute_type_variation.save
      @product_attribute = ProductAttribute.new product_id: @product.id, product_attribute_type_id: params[:product_attribute_type_variation_value][:product_attribute_type_id], product_attribute_type_variation_id: @product_attribute_type_variation.id, value: @product.title.to_s + ' ' + params[:product_attribute_type_variation_value][:product_attribute_type_name].to_s
      @product_attribute.save
      @product_attribute_type_variation_value.product_attribute_type_variation_id = @product_attribute_type_variation.id
      @product_attribute_type_variation_value.save
      puts @product_attribute_type_variation.to_yaml
      puts @product_attribute.to_yaml
      puts @product_attribute_type_variation_value.to_yaml
    end


    respond_to do |format|
      if @product_attribute_type_variation_value.save
        if has_product_id
          format.html { redirect_to @product  }
        else
          format.html { redirect_to product_attribute_type_variation_path @product_attribute_type_variation_value.product_attribute_type_variation_id  } 
        end
        # format.html { redirect_to @product_attribute_type_variation_value, notice: 'Product was successfully created.' }	#original default scaffolding value - commented out
        format.json { render json: @product_attribute_type_variation_value, status: :created, location: @product_attribute_type_variation_value }
      else
        format.html { render action: "new" }
        format.json { render json: @product_attribute_type_variation_value.errors, status: :unprocessable_entity }
      end
    end
  end



end
