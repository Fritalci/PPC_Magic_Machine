class ProductAttributesController < InheritedResources::Base

  # POST /product_attributes
  # POST /product_attributes.json
  def create
    @product_attribute = ProductAttribute.new(params[:product_attribute])
    @product = Product.find @product_attribute.product_id
    @product_attribute_type = ProductAttributeType.find @product_attribute.product_attribute_type_id

    @product_attribute.value = @product.title + ' ' + @product_attribute_type.name if @product_attribute.value.blank? 

    respond_to do |format|
      if @product_attribute.save
      	puts params[:product_page]
      	puts params[:product_page]
      	puts params[:product_page]
      	puts params[:product_page]
      	puts params[:product_page]
      	puts params[:product_page]
      	puts params[:product_page]
      	puts params[:product_page]
      	puts params[:product_page]
      	puts params[:product_page]
      	puts params[:product_page]
      	puts params[:product_page]
      	puts params[:product_page]
      	puts params[:product_page]
      	puts params[:product_page]
      	if params[:product_page] == 'true'
	        format.html { redirect_to @product, notice: 'Changed Successfully.' }
	    else
	        format.html { redirect_to @product_attribute, notice: 'Changed Successfully' }
	    end
        format.json { render json: @product_attribute, status: :created, location: @product_attribute }
      else
        format.html { render action: "new" }
        format.json { render json: @product_attribute.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @product_attribute = ProductAttribute.new(params[:product_attribute])
    @product = Product.find @product_attribute.product_id
    @product_attribute_type = ProductAttributeType.find @product_attribute.product_attribute_type_id

    @product_attribute.value = @product.title + ' ' + @product_attribute_type.name if @product_attribute.value.blank? 

    respond_to do |format|
      if @product_attribute.update_attributes(params[:product_attribute])
      	if params[:product_page] == 'true'
	        format.html { redirect_to @product, notice: 'Changed Successfully.' }
	    else
	        format.html { redirect_to @product_attribute, notice: 'Changed Successfully' }
	    end
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @product_attribute.errors, status: :unprocessable_entity }
      end
    end
  end



end
