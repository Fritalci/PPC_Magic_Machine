class ProductsController < ApplicationController
  # GET /products
  # GET /products.json
  def index
    @products = Product.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @products }
    end
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @product = Product.find(params[:id])

    @available_attribute_types = Array.new
    @resource_keywords = Hash.new 
    @product.product_attributes.all.each do |product_attribute| #this creates the @available_attribute_types array so we know what we're working with
      puts product_attribute.product_attribute_type.to_yaml
      @available_attribute_types << product_attribute.product_attribute_type.name

      @resource_keywords[product_attribute.product_attribute_type.name] = Array.new
      #below prints product_attribute_type_variations data for each record if there are variations for the value.  
      if product_attribute.product_attribute_type.product_attribute_type_variations.empty?
        @resource_keywords[product_attribute.product_attribute_type.name] << product_attribute.value #no product variation, only 1, and use the value of it as keyword.
      else 
        product_attribute.product_attribute_type.product_attribute_type_variations.first.product_attribute_type_variation_values.each do |variation_value|
          @resource_keywords[product_attribute.product_attribute_type.name] << variation_value.value
        end
        #there is variations, make sure to store all of htem with a .each.  
      end
    end

    @adwords_excel_data = Array.new
    @adwords_excel_data[0] = Hash.new 
    @adwords_excel_data[0][:campaign] = 'Campaign'
    @adwords_excel_data[0][:ad_group] = 'Ad Group'
    @adwords_excel_data[0][:keyword] = 'Keyword'
    @adwords_excel_data[0][:match_type] = 'Match Type'

    one_excel_row = Hash.new 

    if(@available_attribute_types.include?('Book Title') and @available_attribute_types.include?('Book Edition'))
      one_excel_row = Hash.new 
      one_excel_row[:campaign] = 'Book Title Book Edition'
      one_excel_row[:ad_group] = 'Book Title Book Edition'
      @resource_keywords['Book Title'].each do |book_title| 
        puts book_title
        @resource_keywords['Book Edition'].each do |book_edition| 
          one_excel_row[:keyword] = "#{book_edition} #{book_title}"
          one_excel_row[:match_type] = 'broad'          
          @adwords_excel_data << one_excel_row.clone #if clone method is not used, when hash changes for next value, all values will be the same

          one_excel_row[:match_type] = 'phrase'
          one_excel_row[:keyword] = "\"#{book_edition} #{book_title}\""
          @adwords_excel_data << one_excel_row.clone #if clone method is not used, when hash changes for next value, all values will be the same

          one_excel_row[:match_type] = 'exact'
          one_excel_row[:keyword] = "[#{book_edition} #{book_title}]"
          @adwords_excel_data << one_excel_row.clone #if clone method is not used, when hash changes for next value, all values will be the same
        end
      end
    end

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @product }
      format.csv { send_data to_csv(@adwords_excel_data) }
      format.xls # { send_data to_csv(@adwords_excel_data,col_sep: "\t") }
   end
  end

  def to_csv(hash, options = {})
    # puts hash.to_yaml
    puts '----------------------------------------------'
    puts '----------------------------------------------'
    puts '----------------------------------------------'
    puts '----------------------------------------------'
    puts '----------------------------------------------'
    CSV.generate(options) do |csv|
      hash.each do |value|
        csv << value 
        puts value.to_yaml
#        csv << value
      end      
    end
  end

  # GET /products/new
  # GET /products/new.json
  def new
    @product = Product.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @product }
    end
  end

  # GET /products/1/edit
  def edit
    @product = Product.find(params[:id])
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(params[:product])

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render json: @product, status: :created, location: @product }
      else
        format.html { render action: "new" }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /products/1
  # PUT /products/1.json
  def update
    @product = Product.find(params[:id])

    respond_to do |format|
      if @product.update_attributes(params[:product])
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    respond_to do |format|
      format.html { redirect_to products_url }
      format.json { head :no_content }
    end
  end
end
