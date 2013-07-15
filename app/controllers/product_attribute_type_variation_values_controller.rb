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
  	puts ''
  	puts ''
  	puts ''
  	puts '' 
  	puts '' 
  	puts '' 
  	puts ''

    @product_attribute_type_variation_value = ProductAttributeTypeVariationValue.new(params[:product_attribute_type_variation_value])

    puts @product_attribute_type_variation_value.product_attribute_type_variation_id
    puts @product_attribute_type_variation_value.product_attribute_type_variation_id
    puts @product_attribute_type_variation_value.product_attribute_type_variation_id
    puts @product_attribute_type_variation_value.product_attribute_type_variation_id
    puts @product_attribute_type_variation_value.product_attribute_type_variation_id
    puts @product_attribute_type_variation_value.product_attribute_type_variation_id
    puts @product_attribute_type_variation_value.product_attribute_type_variation_id
    puts @product_attribute_type_variation_value.product_attribute_type_variation_id
    puts @product_attribute_type_variation_value.product_attribute_type_variation_id
    puts @product_attribute_type_variation_value.product_attribute_type_variation_id

    puts @product_attribute_type_variation_value.to_yaml

    puts 'MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMm'
    puts 'MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMm'
    puts 'MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMm'
    puts 'MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMm'

    #need to add code to check if @product_attribute_exists 
    #if exists
    	#need to add in some code to create the @product_attribute
  	#end

    #need to add code to check if @product_attribute_type_variation exists 
    # if exists 
	    #need to add in some code to create the @product_attribute_type_variation
	  #end 

	  #need to check if product matches the one being sent for.  
	  #if it does not, then we need to create it


    respond_to do |format|
      if @product_attribute_type_variation_value.save
		    puts @product_attribute_type_variation_value.to_yaml

		    puts ''
		    puts ''
		    puts ''
		    puts ''
		    puts ''
		    puts ''
		    puts '' 
		    puts '' 
		    puts '' 
		    puts '' 
		    puts ''
		    puts '12'
		    puts @product_attribute_type_variation_value.to_yaml 
		    puts '34'
		    puts @product_attribute_type_variation_value.product_attribute_type_variation.to_yaml 
		    puts '56'
		    puts @product_attribute_type_variation_value.product_attribute_type_variation.product_attributes.to_yaml 
		    puts '78'

		    @product = @product_attribute_type_variation_value.product_attribute_type_variation.product_attributes.first.product
        format.html { redirect_to @product  }
        # format.html { redirect_to @product_attribute_type_variation_value, notice: 'Product was successfully created.' }	#original default scaffolding value - commented out
        format.json { render json: @product_attribute_type_variation_value, status: :created, location: @product_attribute_type_variation_value }
      else
        format.html { render action: "new" }
        format.json { render json: @product_attribute_type_variation_value.errors, status: :unprocessable_entity }
      end
    end
  end



end
