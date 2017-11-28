require 'test_helper'

class ItemsControllerTest < ActionController::TestCase
  
  # For Devise >= 4.1.1
  include Devise::Test::ControllerHelpers
  # Use the following instead if you are on Devise <= 4.1.0
  # include Devise::TestHelpers

  def setup
    @request.env["devise.mapping"] = Devise.mappings[:admin]
    sign_in FactoryGirl.create(:admin)
  end
  setup do
    @item = items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create item" do
    assert_difference('Item.count') do
      post :create, item: { category_id: @item.category_id, daily_price: @item.daily_price, description: @item.description, monthly_price: @item.monthly_price, name: @item.name, quantity: @item.quantity, size: @item.size, user_id: @item.user_id, weekly_price: @item.weekly_price, weight: @item.weight }
    end

    assert_redirected_to item_path(assigns(:item))
  end

  test "should show item" do
    get :show, id: @item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @item
    assert_response :success
  end

  test "should update item" do
    patch :update, id: @item, item: { category_id: @item.category_id, daily_price: @item.daily_price, description: @item.description, monthly_price: @item.monthly_price, name: @item.name, quantity: @item.quantity, size: @item.size, user_id: @item.user_id, weekly_price: @item.weekly_price, weight: @item.weight }
    assert_redirected_to item_path(assigns(:item))
  end

  test "should destroy item" do
    assert_difference('Item.count', -1) do
      delete :destroy, id: @item
    end

    assert_redirected_to items_path
  end
end
