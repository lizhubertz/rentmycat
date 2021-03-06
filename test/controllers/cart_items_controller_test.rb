require 'test_helper'

class CartItemsControllerTest < ActionController::TestCase
  setup do
    @cart_item = cart_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cart_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cart_item" do
    assert_difference('CartItem.count') do
      post :create, cat_id: cats(:one).id
    end

    assert_redirected_to store_path
  end

  test "should show cart_item" do
    get :show, id: @cart_item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cart_item
    assert_response :success
  end

  test "should update cart_item" do
    patch :update, id: @cart_item, cart_item: { cart_id: @cart_item.cart_id, cat_id: @cart_item.cat_id }
    assert_redirected_to cart_item_path(assigns(:cart_item))
  end

  test "should destroy cart_item" do
    assert_difference('CartItem.count', -1) do
      delete :destroy, id: @cart_item
    end

    assert_redirected_to store_path
  end

  test "should create cart_item via ajax" do
    assert_difference('CartItem.count') do
      xhr :post, :create, cat_id: cats(:one).id
    end

    assert_response :success
    assert_select_jquery :html, '#cart' do
      assert_select 'tr#current_item td', /Cat1/
    end
  end
end
