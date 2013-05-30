require 'test_helper'

class ProductAttributeTypeVariationsControllerTest < ActionController::TestCase
  setup do
    @product_attribute_type_variation = product_attribute_type_variations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:product_attribute_type_variations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create product_attribute_type_variation" do
    assert_difference('ProductAttributeTypeVariation.count') do
      post :create, product_attribute_type_variation: { name: @product_attribute_type_variation.name, product_attribute_type_id: @product_attribute_type_variation.product_attribute_type_id }
    end

    assert_redirected_to product_attribute_type_variation_path(assigns(:product_attribute_type_variation))
  end

  test "should show product_attribute_type_variation" do
    get :show, id: @product_attribute_type_variation
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @product_attribute_type_variation
    assert_response :success
  end

  test "should update product_attribute_type_variation" do
    put :update, id: @product_attribute_type_variation, product_attribute_type_variation: { name: @product_attribute_type_variation.name, product_attribute_type_id: @product_attribute_type_variation.product_attribute_type_id }
    assert_redirected_to product_attribute_type_variation_path(assigns(:product_attribute_type_variation))
  end

  test "should destroy product_attribute_type_variation" do
    assert_difference('ProductAttributeTypeVariation.count', -1) do
      delete :destroy, id: @product_attribute_type_variation
    end

    assert_redirected_to product_attribute_type_variations_path
  end
end
