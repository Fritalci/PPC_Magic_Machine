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
    @adwords_excel_data[0][:destination_url] = 'Destination Url'

    #add_variations_to_excel_array @available_attribute_types, ['Book Title', 'Book Edition']
    #what we ultimately want the method to look similar to.  


    puts @available_attribute_types.to_yaml
    puts @available_attribute_types.to_yaml
    puts @available_attribute_types.to_yaml
    puts @available_attribute_types.to_yaml
    puts @available_attribute_types.to_yaml
    puts @available_attribute_types.to_yaml
    puts @available_attribute_types.to_yaml
    puts @available_attribute_types.to_yaml
    puts @available_attribute_types.to_yaml
    puts @available_attribute_types.to_yaml
    puts @available_attribute_types.to_yaml
    puts @available_attribute_types.to_yaml
    puts @available_attribute_types.to_yaml
    puts @available_attribute_types.to_yaml


    @adwords_excel_data.concat(add_variations_to_excel_array(['Author','Edition'], 'broad', @available_attribute_types, @resource_keywords, @product.title, @product.url).to_a)
    @adwords_excel_data.concat(add_variations_to_excel_array(['Author','Edition'], 'exact', @available_attribute_types, @resource_keywords, @product.title, @product.url).to_a)
    @adwords_excel_data.concat(add_variations_to_excel_array(['Author','Edition'], 'phrase', @available_attribute_types, @resource_keywords, @product.title, @product.url).to_a)
    @adwords_excel_data.concat(add_variations_to_excel_array(['Edition','Author'], 'exact', @available_attribute_types, @resource_keywords, @product.title, @product.url).to_a)
    @adwords_excel_data.concat(add_variations_to_excel_array(['Edition','Author'], 'phrase', @available_attribute_types, @resource_keywords, @product.title, @product.url).to_a)
    @adwords_excel_data.concat(add_variations_to_excel_array(['Author','Edition','Digital'], 'broad', @available_attribute_types, @resource_keywords, @product.title, @product.url).to_a)
    @adwords_excel_data.concat(add_variations_to_excel_array(['Author','Edition','Book'], 'broad', @available_attribute_types, @resource_keywords, @product.title, @product.url).to_a)
    @adwords_excel_data.concat(add_variations_to_excel_array(['Author','Subject'], 'phrase', @available_attribute_types, @resource_keywords, @product.title, @product.url).to_a)
    @adwords_excel_data.concat(add_variations_to_excel_array(['Author','Subject'], 'broad', @available_attribute_types, @resource_keywords, @product.title, @product.url).to_a)
    @adwords_excel_data.concat(add_variations_to_excel_array(['Author','Subject'], 'exact', @available_attribute_types, @resource_keywords, @product.title, @product.url).to_a)
    @adwords_excel_data.concat(add_variations_to_excel_array(['Subject','Author'], 'exact', @available_attribute_types, @resource_keywords, @product.title, @product.url).to_a)
    @adwords_excel_data.concat(add_variations_to_excel_array(['Subject','Author'], 'phrase', @available_attribute_types, @resource_keywords, @product.title, @product.url).to_a)
    @adwords_excel_data.concat(add_variations_to_excel_array(['Author','Subject','Digital'], 'broad', @available_attribute_types, @resource_keywords, @product.title, @product.url).to_a)

    @adwords_excel_data.concat(add_variations_to_excel_array(['Author','Edition','Subject'], 'phrase', @available_attribute_types, @resource_keywords, @product.title, @product.url).to_a)
    @adwords_excel_data.concat(add_variations_to_excel_array(['Author','Edition','Subject'], 'exact', @available_attribute_types, @resource_keywords, @product.title, @product.url).to_a)
    @adwords_excel_data.concat(add_variations_to_excel_array(['Author','Subject','Edition'], 'exact', @available_attribute_types, @resource_keywords, @product.title, @product.url).to_a)
    @adwords_excel_data.concat(add_variations_to_excel_array(['Author','Subject','Edition'], 'phrase', @available_attribute_types, @resource_keywords, @product.title, @product.url).to_a)
    @adwords_excel_data.concat(add_variations_to_excel_array(['Author','Subject','Edition'], 'broad', @available_attribute_types, @resource_keywords, @product.title, @product.url).to_a)
    @adwords_excel_data.concat(add_variations_to_excel_array(['Edition','Author','Subject'], 'exact', @available_attribute_types, @resource_keywords, @product.title, @product.url).to_a)
    @adwords_excel_data.concat(add_variations_to_excel_array(['Edition','Author','Subject'], 'phrase', @available_attribute_types, @resource_keywords, @product.title, @product.url).to_a)
    @adwords_excel_data.concat(add_variations_to_excel_array(['Edition','Subject','Author'], 'exact', @available_attribute_types, @resource_keywords, @product.title, @product.url).to_a)
    @adwords_excel_data.concat(add_variations_to_excel_array(['Edition','Subject','Author'], 'phrase', @available_attribute_types, @resource_keywords, @product.title, @product.url).to_a)
    @adwords_excel_data.concat(add_variations_to_excel_array(['Subject','Author','Edition'], 'exact', @available_attribute_types, @resource_keywords, @product.title, @product.url).to_a)
    @adwords_excel_data.concat(add_variations_to_excel_array(['Subject','Author','Edition'], 'phrase', @available_attribute_types, @resource_keywords, @product.title, @product.url).to_a)
    @adwords_excel_data.concat(add_variations_to_excel_array(['Subject','Edition','Author'], 'exact', @available_attribute_types, @resource_keywords, @product.title, @product.url).to_a)
    @adwords_excel_data.concat(add_variations_to_excel_array(['Subject','Edition','Author'], 'phrase', @available_attribute_types, @resource_keywords, @product.title, @product.url).to_a)
    @adwords_excel_data.concat(add_variations_to_excel_array(['Author In Title','Edition','Subject'], 'exact', @available_attribute_types, @resource_keywords, @product.title, @product.url).to_a)
    @adwords_excel_data.concat(add_variations_to_excel_array(['Author In Title','Edition','Subject'], 'phrase', @available_attribute_types, @resource_keywords, @product.title, @product.url).to_a)
    @adwords_excel_data.concat(add_variations_to_excel_array(['Author In Title','Subject','Edition'], 'exact', @available_attribute_types, @resource_keywords, @product.title, @product.url).to_a)
    @adwords_excel_data.concat(add_variations_to_excel_array(['Author In Title','Subject','Edition'], 'phrase', @available_attribute_types, @resource_keywords, @product.title, @product.url).to_a)
    @adwords_excel_data.concat(add_variations_to_excel_array(['Author In Title','Subject','Edition'], 'broad', @available_attribute_types, @resource_keywords, @product.title, @product.url).to_a)
    @adwords_excel_data.concat(add_variations_to_excel_array(['Edition','Author In Title','Subject'], 'exact', @available_attribute_types, @resource_keywords, @product.title, @product.url).to_a)
    @adwords_excel_data.concat(add_variations_to_excel_array(['Edition','Author In Title','Subject'], 'phrase', @available_attribute_types, @resource_keywords, @product.title, @product.url).to_a)
    @adwords_excel_data.concat(add_variations_to_excel_array(['Edition','Subject','Author In Title'], 'exact', @available_attribute_types, @resource_keywords, @product.title, @product.url).to_a)
    @adwords_excel_data.concat(add_variations_to_excel_array(['Edition','Subject','Author In Title'], 'phrase', @available_attribute_types, @resource_keywords, @product.title, @product.url).to_a)
    @adwords_excel_data.concat(add_variations_to_excel_array(['Subject','Author In Title','Edition'], 'exact', @available_attribute_types, @resource_keywords, @product.title, @product.url).to_a)
    @adwords_excel_data.concat(add_variations_to_excel_array(['Subject','Author In Title','Edition'], 'phrase', @available_attribute_types, @resource_keywords, @product.title, @product.url).to_a)
    @adwords_excel_data.concat(add_variations_to_excel_array(['Subject','Edition','Author In Title'], 'exact', @available_attribute_types, @resource_keywords, @product.title, @product.url).to_a)
    @adwords_excel_data.concat(add_variations_to_excel_array(['Subject','Edition','Author In Title'], 'phrase', @available_attribute_types, @resource_keywords, @product.title, @product.url).to_a)

    @adwords_excel_data.concat(add_variations_to_excel_array(['Author','Subject','Edition','Book'], 'broad', @available_attribute_types, @resource_keywords, @product.title, @product.url).to_a)
    @adwords_excel_data.concat(add_variations_to_excel_array(['Author In Title','Subject','Edition','Book'], 'broad', @available_attribute_types, @resource_keywords, @product.title, @product.url).to_a)
    @adwords_excel_data.concat(add_variations_to_excel_array(['Author','Subject','Edition','Digital'], 'broad', @available_attribute_types, @resource_keywords, @product.title, @product.url).to_a)
    @adwords_excel_data.concat(add_variations_to_excel_array(['Author In Title','Subject','Edition','Digital'], 'broad', @available_attribute_types, @resource_keywords, @product.title, @product.url).to_a)
    @adwords_excel_data.concat(add_variations_to_excel_array(['Author','Edition','Title'], 'exact', @available_attribute_types, @resource_keywords, @product.title, @product.url).to_a)
    @adwords_excel_data.concat(add_variations_to_excel_array(['Author','Edition','Title'], 'phrase', @available_attribute_types, @resource_keywords, @product.title, @product.url).to_a)
    @adwords_excel_data.concat(add_variations_to_excel_array(['Author','Title','Edition'], 'exact', @available_attribute_types, @resource_keywords, @product.title, @product.url).to_a)
    @adwords_excel_data.concat(add_variations_to_excel_array(['Author','Title','Edition'], 'phrase', @available_attribute_types, @resource_keywords, @product.title, @product.url).to_a)
    @adwords_excel_data.concat(add_variations_to_excel_array(['Author','Title','Edition'], 'broad', @available_attribute_types, @resource_keywords, @product.title, @product.url).to_a)
    @adwords_excel_data.concat(add_variations_to_excel_array(['Edition','Author','Title'], 'exact', @available_attribute_types, @resource_keywords, @product.title, @product.url).to_a)
    @adwords_excel_data.concat(add_variations_to_excel_array(['Edition','Author','Title'], 'phrase', @available_attribute_types, @resource_keywords, @product.title, @product.url).to_a)
    @adwords_excel_data.concat(add_variations_to_excel_array(['Edition','Title','Author'], 'exact', @available_attribute_types, @resource_keywords, @product.title, @product.url).to_a)
    @adwords_excel_data.concat(add_variations_to_excel_array(['Edition','Title','Author'], 'phrase', @available_attribute_types, @resource_keywords, @product.title, @product.url).to_a)
    @adwords_excel_data.concat(add_variations_to_excel_array(['Title','Author','Edition'], 'exact', @available_attribute_types, @resource_keywords, @product.title, @product.url).to_a)
    @adwords_excel_data.concat(add_variations_to_excel_array(['Title','Author','Edition'], 'phrase', @available_attribute_types, @resource_keywords, @product.title, @product.url).to_a)
    @adwords_excel_data.concat(add_variations_to_excel_array(['Title','Edition','Author'], 'exact', @available_attribute_types, @resource_keywords, @product.title, @product.url).to_a)
    @adwords_excel_data.concat(add_variations_to_excel_array(['Title','Edition','Author'], 'phrase', @available_attribute_types, @resource_keywords, @product.title, @product.url).to_a)
    @adwords_excel_data.concat(add_variations_to_excel_array(['Author','Title','Edition','Book'], 'broad', @available_attribute_types, @resource_keywords, @product.title, @product.url).to_a)
    @adwords_excel_data.concat(add_variations_to_excel_array(['Author','Title','Edition','Digital'], 'broad', @available_attribute_types, @resource_keywords, @product.title, @product.url).to_a)
    @adwords_excel_data.concat(add_variations_to_excel_array(['Edition','Title'], 'exact', @available_attribute_types, @resource_keywords, @product.title, @product.url).to_a)
    @adwords_excel_data.concat(add_variations_to_excel_array(['Edition','Title'], 'phrase', @available_attribute_types, @resource_keywords, @product.title, @product.url).to_a)
    @adwords_excel_data.concat(add_variations_to_excel_array(['Title','Edition'], 'exact', @available_attribute_types, @resource_keywords, @product.title, @product.url).to_a)
    @adwords_excel_data.concat(add_variations_to_excel_array(['Title','Edition'], 'phrase', @available_attribute_types, @resource_keywords, @product.title, @product.url).to_a)
    @adwords_excel_data.concat(add_variations_to_excel_array(['Title','Edition'], 'broad', @available_attribute_types, @resource_keywords, @product.title, @product.url).to_a)
    @adwords_excel_data.concat(add_variations_to_excel_array(['Title','Edition','Book'], 'broad', @available_attribute_types, @resource_keywords, @product.title, @product.url).to_a)
    @adwords_excel_data.concat(add_variations_to_excel_array(['Title','Edition','Digital'], 'broad', @available_attribute_types, @resource_keywords, @product.title, @product.url).to_a)
    @adwords_excel_data.concat(add_variations_to_excel_array(['Author','Subject','Book'], 'broad', @available_attribute_types, @resource_keywords, @product.title, @product.url).to_a)
    @adwords_excel_data.concat(add_variations_to_excel_array(['Author In Title','Subject','Book'], 'broad', @available_attribute_types, @resource_keywords, @product.title, @product.url).to_a)
    @adwords_excel_data.concat(add_variations_to_excel_array(['Author In Title','Subject','Digital'], 'broad', @available_attribute_types, @resource_keywords, @product.title, @product.url).to_a)
    @adwords_excel_data.concat(add_variations_to_excel_array(['Author','Title'], 'exact', @available_attribute_types, @resource_keywords, @product.title, @product.url).to_a)
    @adwords_excel_data.concat(add_variations_to_excel_array(['Author','Title'], 'phrase', @available_attribute_types, @resource_keywords, @product.title, @product.url).to_a)
    @adwords_excel_data.concat(add_variations_to_excel_array(['Author','Title'], 'broad', @available_attribute_types, @resource_keywords, @product.title, @product.url).to_a)
    @adwords_excel_data.concat(add_variations_to_excel_array(['Title','Author'], 'exact', @available_attribute_types, @resource_keywords, @product.title, @product.url).to_a)
    @adwords_excel_data.concat(add_variations_to_excel_array(['Title','Author'], 'phrase', @available_attribute_types, @resource_keywords, @product.title, @product.url).to_a)
    @adwords_excel_data.concat(add_variations_to_excel_array(['Author','Title','Book'], 'broad', @available_attribute_types, @resource_keywords, @product.title, @product.url).to_a)
    @adwords_excel_data.concat(add_variations_to_excel_array(['Author','Title','Digital'], 'broad', @available_attribute_types, @resource_keywords, @product.title, @product.url).to_a)
    @adwords_excel_data.concat(add_variations_to_excel_array(['Author In Title','Subject'], 'exact', @available_attribute_types, @resource_keywords, @product.title, @product.url).to_a)
    @adwords_excel_data.concat(add_variations_to_excel_array(['Author In Title','Subject'], 'phrase', @available_attribute_types, @resource_keywords, @product.title, @product.url).to_a)
    @adwords_excel_data.concat(add_variations_to_excel_array(['Author In Title','Subject'], 'broad', @available_attribute_types, @resource_keywords, @product.title, @product.url).to_a)
    @adwords_excel_data.concat(add_variations_to_excel_array(['Subject','Author In Title'], 'exact', @available_attribute_types, @resource_keywords, @product.title, @product.url).to_a)
    @adwords_excel_data.concat(add_variations_to_excel_array(['Subject','Author In Title'], 'phrase', @available_attribute_types, @resource_keywords, @product.title, @product.url).to_a)
    @adwords_excel_data.concat(add_variations_to_excel_array(['Author In Title','Edition'], 'broad', @available_attribute_types, @resource_keywords, @product.title, @product.url).to_a)
    @adwords_excel_data.concat(add_variations_to_excel_array(['Author In Title','Edition'], 'phrase', @available_attribute_types, @resource_keywords, @product.title, @product.url).to_a)
    @adwords_excel_data.concat(add_variations_to_excel_array(['Author In Title','Edition'], 'exact', @available_attribute_types, @resource_keywords, @product.title, @product.url).to_a)
    @adwords_excel_data.concat(add_variations_to_excel_array(['Edition','Author In Title'], 'phrase', @available_attribute_types, @resource_keywords, @product.title, @product.url).to_a)
    @adwords_excel_data.concat(add_variations_to_excel_array(['Edition','Author In Title'], 'exact', @available_attribute_types, @resource_keywords, @product.title, @product.url).to_a)
    @adwords_excel_data.concat(add_variations_to_excel_array(['Author In Title','Edition','Digital'], 'broad', @available_attribute_types, @resource_keywords, @product.title, @product.url).to_a)
    @adwords_excel_data.concat(add_variations_to_excel_array(['Author In Title','Edition','Book'], 'broad', @available_attribute_types, @resource_keywords, @product.title, @product.url).to_a)





    #next steps, allow for variation okther than 2,for example, 1, 3, 4, and 5.


    #original code for the method below before we startede to build the method. 
    # if(@available_attribute_types.include?('Book Title') and @available_attribute_types.include?('Book Edition'))
    #   one_excel_row = Hash.new 
    #   one_excel_row[:campaign] = 'Book Title Book Edition'
    #   one_excel_row[:ad_group] = 'Book Title Book Edition'
    #   @resource_keywords['Book Title'].each do |book_title| 
    #     puts book_title
    #     @resource_keywords['Book Edition'].each do |book_edition| 
    #       one_excel_row[:keyword] = "#{book_edition} #{book_title}"
    #       one_excel_row[:match_type] = 'broad'          
    #       @adwords_excel_data << one_excel_row.clone #if clone method is not used, when hash changes for next value, all values will be the same

    #       one_excel_row[:match_type] = 'phrase'
    #       one_excel_row[:keyword] = "\"#{book_edition} #{book_title}\""
    #       @adwords_excel_data << one_excel_row.clone #if clone method is not used, when hash changes for next value, all values will be the same

    #       one_excel_row[:match_type] = 'exact'
    #       one_excel_row[:keyword] = "[#{book_edition} #{book_title}]"
    #       @adwords_excel_data << one_excel_row.clone #if clone method is not used, when hash changes for next value, all values will be the same
    #     end
    #   end
    # end

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @product }
      format.csv
      format.xls # { send_data to_csv(@adwords_excel_data,col_sep: "\t") }
   end
  end

  def add_variations_to_excel_array(array_of_keywords_to_use, match_type, available_attribute_types, resource_keywords, campaign_name, url)
    puts 'METHOD START METHOD START METHOD START METHOD START METHOD START METHOD START METHOD START METHOD START '
    puts 'METHOD START METHOD START METHOD START METHOD START METHOD START METHOD START METHOD START METHOD START '

#    if(available_attribute_types.include?(array_of_keywords_to_use[0]) and available_attribute_types.include?(array_of_keywords_to_use[1]))
    contains_all_attribute_types = true

    array_of_keywords_to_use.each { 
      |attribute_type| 
      contains_all_attribute_types = false unless available_attribute_types.include? attribute_type 
    }
    if contains_all_attribute_types
      adwords_excel_data = Array.new 
      one_excel_row = Hash.new 

      puts resource_keywords.to_yaml
      puts ''
      puts ''
      puts ''
      puts resource_keywords.to_yaml
      puts ''
      puts ''
      puts ''
      puts resource_keywords.to_yaml
      puts ''
      puts ''
      puts ''
      puts resource_keywords.to_yaml
      puts ''
      puts ''
      puts ''

      ad_group_name = ' '
      array_of_keywords_to_use.each do |keyword|
        puts keyword
        puts resource_keywords[keyword]
        puts resource_keywords[keyword][0]
        ad_group_name += resource_keywords[keyword][0] + ' '
      end

      puts ad_group_name
      puts ad_group_name
      puts ad_group_name
      puts ad_group_name
      puts ad_group_name
      puts ad_group_name
      puts ad_group_name
      puts ad_group_name
      puts ad_group_name
      puts ad_group_name
      puts ad_group_name
      puts ad_group_name
      puts ad_group_name
      puts ad_group_name
      puts ad_group_name

      one_excel_row[:campaign] = campaign_name.html_safe
      one_excel_row[:ad_group] = ad_group_name.strip.html_safe
      one_excel_row[:destination_url] = url.html_safe

      resource_keywords[array_of_keywords_to_use[0]].each do |keyword_1| 

        resource_keywords[array_of_keywords_to_use[1]].each do |keyword_2| 
          if array_of_keywords_to_use.size == 2
            if match_type == 'broad'
              one_excel_row[:keyword] = "#{keyword_1} #{keyword_2}"
              one_excel_row[:match_type] = 'broad'          
              adwords_excel_data << one_excel_row.clone #if clone method is not used, when hash changes for next value, all values will be the same
            end

            if match_type == 'phrase'
              one_excel_row[:match_type] = 'phrase'
              one_excel_row[:keyword] = "\"#{keyword_1} #{keyword_2}\"".html_safe
              adwords_excel_data << one_excel_row.clone #if clone method is not used, when hash changes for next value, all values will be the same
            end

            if match_type == 'exact'
              one_excel_row[:match_type] = 'exact'
              one_excel_row[:keyword] = "[#{keyword_1} #{keyword_2}]"
              adwords_excel_data << one_excel_row.clone #if clone method is not used, when hash changes for next value, all values will be the same
            end

          else  #else, means we have more than two keywords and need to create a third array option. 
            resource_keywords[array_of_keywords_to_use[2]].each do |keyword_3| 
              if array_of_keywords_to_use.size == 3
                if match_type == 'broad'
                  one_excel_row[:keyword] = "#{keyword_1} #{keyword_2} #{keyword_3}"
                  one_excel_row[:match_type] = 'broad'          
                  adwords_excel_data << one_excel_row.clone #if clone method is not used, when hash changes for next value, all values will be the same
                end

                if match_type == 'phrase'
                  one_excel_row[:match_type] = 'phrase'
                  one_excel_row[:keyword] = "\"#{keyword_1} #{keyword_2} #{keyword_3}\"".html_safe
                  adwords_excel_data << one_excel_row.clone #if clone method is not used, when hash changes for next value, all values will be the same
                end

                if match_type == 'exact'
                  one_excel_row[:match_type] = 'exact'
                  one_excel_row[:keyword] = "[#{keyword_1} #{keyword_2} #{keyword_3}]"
                  adwords_excel_data << one_excel_row.clone #if clone method is not used, when hash changes for next value, all values will be the same
                end

              else  #else, means we have more than three keywords and need to create a fourth array option
                resource_keywords[array_of_keywords_to_use[3]].each do |keyword_4| 
                  if array_of_keywords_to_use.size == 4

                    if match_type == 'broad'
                      one_excel_row[:keyword] = "#{keyword_1} #{keyword_2} #{keyword_3} #{keyword_4}"
                      one_excel_row[:match_type] = 'broad'          
                      adwords_excel_data << one_excel_row.clone #if clone method is not used, when hash changes for next value, all values will be the same
                    end

                    if match_type == 'phrase'
                      one_excel_row[:match_type] = 'phrase'
                      one_excel_row[:keyword] = "\"#{keyword_1} #{keyword_2} #{keyword_3} #{keyword_4}\"".html_safe
                      adwords_excel_data << one_excel_row.clone #if clone method is not used, when hash changes for next value, all values will be the same
                    end

                    if match_type == 'exact'
                      one_excel_row[:match_type] = 'exact'
                      one_excel_row[:keyword] = "[#{keyword_1} #{keyword_2} #{keyword_3} #{keyword_4}]"
                      adwords_excel_data << one_excel_row.clone #if clone method is not used, when hash changes for next value, all values will be the same
                    end

                  end
                end
              end
            end
          end

        end
      end

      puts 'METHOD END METHOD END METHOD END METHOD END METHOD END MEHTOD END METHOD END METHOD END METHOD END METHOD END'
      puts 'METHOD END METHOD END METHOD END METHOD END METHOD END MEHTOD END METHOD END METHOD END METHOD END METHOD END'
      return adwords_excel_data
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
