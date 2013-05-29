require 'test_helper'

class ProductAttributeTypesControllerTest < ActionController::TestCase
  setup do
    @product_attribute_type = product_attribute_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:product_attribute_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create product_attribute_type" do
    assert_difference('ProductAttributeType.count') do
      post :create, product_attribute_type: { name: @product_attribute_type.name }
    end

    assert_redirected_to product_attribute_type_path(assigns(:product_attribute_type))
  end

  test "should show product_attribute_type" do
    get :show, id: @product_attribute_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @product_attribute_type
    assert_response :success
  end

  test "should update product_attribute_type" do
    put :update, id: @product_attribute_type, product_attribute_type: { name: @product_attribute_type.name }
    assert_redirected_to product_attribute_type_path(assigns(:product_attribute_type))
  end

  test "should destroy product_attribute_type" do
    assert_difference('ProductAttributeType.count', -1) do
      delete :destroy, id: @product_attribute_type
    end

    assert_redirected_to product_attribute_types_path
  end
end
