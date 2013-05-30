require 'test_helper'

class ProductAttributeTypeVariationValuesControllerTest < ActionController::TestCase
  setup do
    @product_attribute_type_variation_value = product_attribute_type_variation_values(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:product_attribute_type_variation_values)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create product_attribute_type_variation_value" do
    assert_difference('ProductAttributeTypeVariationValue.count') do
      post :create, product_attribute_type_variation_value: { product_attribute_type_variation_id: @product_attribute_type_variation_value.product_attribute_type_variation_id, value: @product_attribute_type_variation_value.value }
    end

    assert_redirected_to product_attribute_type_variation_value_path(assigns(:product_attribute_type_variation_value))
  end

  test "should show product_attribute_type_variation_value" do
    get :show, id: @product_attribute_type_variation_value
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @product_attribute_type_variation_value
    assert_response :success
  end

  test "should update product_attribute_type_variation_value" do
    put :update, id: @product_attribute_type_variation_value, product_attribute_type_variation_value: { product_attribute_type_variation_id: @product_attribute_type_variation_value.product_attribute_type_variation_id, value: @product_attribute_type_variation_value.value }
    assert_redirected_to product_attribute_type_variation_value_path(assigns(:product_attribute_type_variation_value))
  end

  test "should destroy product_attribute_type_variation_value" do
    assert_difference('ProductAttributeTypeVariationValue.count', -1) do
      delete :destroy, id: @product_attribute_type_variation_value
    end

    assert_redirected_to product_attribute_type_variation_values_path
  end
end
