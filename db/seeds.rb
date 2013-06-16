# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Company.destroy_all
boundless = Company.create name: 'Boundless Learning'

Product.destroy_all
concepts_algebra = Product.create company_id: boundless.id, title: 'Concepts of Algebra 4th Edition', url: 'http://4theditinoconceptsalgebra.com', isbn: '27353253523353nnn'

ProductAttributeType.destroy_all
author = ProductAttributeType.create(name: 'Author')
edition = ProductAttributeType.create(name: 'Edition')
digital = ProductAttributeType.create(name: 'Digital')
book = ProductAttributeType.create(name: 'Book')
subject = ProductAttributeType.create(name: 'Subject')
author_in_title = ProductAttributeType.create(name: 'Author In Title')
title = ProductAttributeType.create(name: 'Title')

ProductAttributeTypeVariation.destroy_all
algebra_concepts_fourth_author = ProductAttributeTypeVariation.create name: 'Concepts of Algebra Fourth Authors', product_attribute_type_id: author.id 
algebra_concepts_fourth_author_in_title = ProductAttributeTypeVariation.create name: 'Concepts of Algebra Fourth Author In Title', product_attribute_type_id: author_in_title.id 

algebra_subject = ProductAttributeTypeVariation.create name: 'Algebra', product_attribute_type_id: subject.id

algebra_concepts_fourth_title = ProductAttributeTypeVariation.create name: 'Concepts of Algebra Title', product_attribute_type_id: title.id

first_edition = ProductAttributeTypeVariation.create name: '1st Edition', product_attribute_type_id: edition.id 
# 2nd_edition = ProductAttributeTypeVariation.create name: '2nd Edition', product_attribute_type_id: edition.id 
# 3rd_edition = ProductAttributeTypeVariation.create name: '3rd Edition', product_attribute_type_id: edition.id 
fourth_edition = ProductAttributeTypeVariation.create name: '4th Edition', product_attribute_type_id: edition.id 
# 5th_edition = ProductAttributeTypeVariation.create name: '5th Edition', product_attribute_type_id: edition.id 
# 6th_edition = ProductAttributeTypeVariation.create name: '6th Edition', product_attribute_type_id: edition.id 
# 7th_edition = ProductAttributeTypeVariation.create name: '7th Edition', product_attribute_type_id: edition.id 
# 8th_edition = ProductAttributeTypeVariation.create name: '8th Edition', product_attribute_type_id: edition.id 
# 9th_edition = ProductAttributeTypeVariation.create name: '9th Edition', product_attribute_type_id: edition.id 
# 10th_edition = ProductAttributeTypeVariation.create name: '10th Edition', product_attribute_type_id: edition.id 
# 11th_edition = ProductAttributeTypeVariation.create name: '11th Edition', product_attribute_type_id: edition.id 
# 12th_edition = ProductAttributeTypeVariation.create name: '12th Edition', product_attribute_type_id: edition.id 
# 13th_edition = ProductAttributeTypeVariation.create name: '13th Edition', product_attribute_type_id: edition.id 
# 14th_edition = ProductAttributeTypeVariation.create name: '14th Edition', product_attribute_type_id: edition.id 
# 15th_edition = ProductAttributeTypeVariation.create name: '15th Edition', product_attribute_type_id: edition.id 

book_attribute_type_variation = ProductAttributeTypeVariation.create name: 'Book', product_attribute_type_id: book.id 
digital_attribute_type_variation = ProductAttributeTypeVariation.create name: 'Digital', product_attribute_type_id: digital.id

ProductAttributeTypeVariationValue.destroy_all 

ProductAttributeTypeVariationValue.create product_attribute_type_variation_id: first_edition.id, value: '1st. Edition'
ProductAttributeTypeVariationValue.create product_attribute_type_variation_id: first_edition.id, value: '1st. Ed.'
ProductAttributeTypeVariationValue.create product_attribute_type_variation_id: first_edition.id, value: 'First Ed.'
ProductAttributeTypeVariationValue.create product_attribute_type_variation_id: first_edition.id, value: 'First Ed'
ProductAttributeTypeVariationValue.create product_attribute_type_variation_id: first_edition.id, value: 'First Edition'
ProductAttributeTypeVariationValue.create product_attribute_type_variation_id: first_edition.id, value: '1st Edition'
ProductAttributeTypeVariationValue.create product_attribute_type_variation_id: first_edition.id, value: '1st Ed.'

ProductAttributeTypeVariationValue.create product_attribute_type_variation_id: fourth_edition.id, value: '4th. Edition'
ProductAttributeTypeVariationValue.create product_attribute_type_variation_id: fourth_edition.id, value: '4th. Ed.'
ProductAttributeTypeVariationValue.create product_attribute_type_variation_id: fourth_edition.id, value: 'Fourth Ed.'
ProductAttributeTypeVariationValue.create product_attribute_type_variation_id: fourth_edition.id, value: 'Fourth Ed'
ProductAttributeTypeVariationValue.create product_attribute_type_variation_id: fourth_edition.id, value: 'Fourth Edition'
ProductAttributeTypeVariationValue.create product_attribute_type_variation_id: fourth_edition.id, value: '4th Edition'
ProductAttributeTypeVariationValue.create product_attribute_type_variation_id: fourth_edition.id, value: '4th Ed.'


ProductAttributeTypeVariationValue.create product_attribute_type_variation_id: book_attribute_type_variation.id, value: 'Book'
ProductAttributeTypeVariationValue.create product_attribute_type_variation_id: book_attribute_type_variation.id, value: 'Textbook'
ProductAttributeTypeVariationValue.create product_attribute_type_variation_id: book_attribute_type_variation.id, value: 'Text'

ProductAttributeTypeVariationValue.create product_attribute_type_variation_id: digital_attribute_type_variation.id, value: 'PDF'
ProductAttributeTypeVariationValue.create product_attribute_type_variation_id: digital_attribute_type_variation.id, value: 'epub'
ProductAttributeTypeVariationValue.create product_attribute_type_variation_id: digital_attribute_type_variation.id, value: 'online textbook'

ProductAttributeTypeVariationValue.create product_attribute_type_variation_id: algebra_concepts_fourth_author.id, value: 'Smith'
ProductAttributeTypeVariationValue.create product_attribute_type_variation_id: algebra_concepts_fourth_author.id, value: 'Jason Smith'
ProductAttributeTypeVariationValue.create product_attribute_type_variation_id: algebra_concepts_fourth_author.id, value: 'J. Smith'
ProductAttributeTypeVariationValue.create product_attribute_type_variation_id: algebra_concepts_fourth_author.id, value: 'J Smith'
ProductAttributeTypeVariationValue.create product_attribute_type_variation_id: algebra_concepts_fourth_author.id, value: 'Albert White'
ProductAttributeTypeVariationValue.create product_attribute_type_variation_id: algebra_concepts_fourth_author.id, value: 'A White'

ProductAttributeTypeVariationValue.create product_attribute_type_variation_id: algebra_concepts_fourth_author_in_title.id, value: 'Smith'
ProductAttributeTypeVariationValue.create product_attribute_type_variation_id: algebra_concepts_fourth_author_in_title.id, value: 'J Smith'
ProductAttributeTypeVariationValue.create product_attribute_type_variation_id: algebra_concepts_fourth_author_in_title.id, value: 'J. Smith'
ProductAttributeTypeVariationValue.create product_attribute_type_variation_id: algebra_concepts_fourth_author_in_title.id, value: 'Jason Smith'

ProductAttributeTypeVariationValue.create product_attribute_type_variation_id: algebra_subject.id, value: 'Alegebra'
ProductAttributeTypeVariationValue.create product_attribute_type_variation_id: algebra_subject.id, value: 'Algebra'

ProductAttributeTypeVariationValue.create product_attribute_type_variation_id: algebra_concepts_fourth_title.id, value: 'Algebra Concepts'
ProductAttributeTypeVariationValue.create product_attribute_type_variation_id: algebra_concepts_fourth_title.id, value: 'Concepts of Algebra'


ProductAttribute.destroy_all

author_product_attribute = ProductAttribute.create value: 'Smith', product_id: concepts_algebra.id, product_attribute_type_id: author.id, product_attribute_type_variation_id: algebra_concepts_fourth_author.id
edition_product_attribute = ProductAttribute.create value: '4th', product_id: concepts_algebra.id, product_attribute_type_id: edition.id, product_attribute_type_variation_id: fourth_edition.id 
digital_product_attribute = ProductAttribute.create value: 'Digital', product_id: concepts_algebra.id, product_attribute_type_id: digital.id, product_attribute_type_variation_id: digital_attribute_type_variation.id 
book_product_attribute = ProductAttribute.create value: 'Book', product_id: concepts_algebra.id, product_attribute_type_id: book.id, product_attribute_type_variation_id: book_attribute_type_variation.id 
subject_product_attribute = ProductAttribute.create value: 'Algebra', product_id: concepts_algebra.id, product_attribute_type_id: subject.id, product_attribute_type_variation_id: algebra_subject.id 
author_in_title_product_attribute = ProductAttribute.create value: 'Smith', product_id: concepts_algebra.id, product_attribute_type_id: author_in_title.id, product_attribute_type_variation_id: algebra_concepts_fourth_author_in_title.id 
title_product_attribute = ProductAttribute.create value: 'Concepts of Algebra', product_id: concepts_algebra.id, product_attribute_type_id: title.id, product_attribute_type_variation_id: algebra_concepts_fourth_title.id 

