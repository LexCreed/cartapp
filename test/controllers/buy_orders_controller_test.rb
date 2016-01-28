require 'test_helper'

class BuyOrdersControllerTest < ActionController::TestCase
  setup do
    @buy_order = buy_orders(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:buy_orders)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create buy_order" do
    assert_difference('BuyOrder.count') do
      post :create, buy_order: { date_delivery: @buy_order.date_delivery, date_order: @buy_order.date_order, name: @buy_order.name, number_order: @buy_order.number_order, payment: @buy_order.payment }
    end

    assert_redirected_to buy_order_path(assigns(:buy_order))
  end

  test "should show buy_order" do
    get :show, id: @buy_order
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @buy_order
    assert_response :success
  end

  test "should update buy_order" do
    patch :update, id: @buy_order, buy_order: { date_delivery: @buy_order.date_delivery, date_order: @buy_order.date_order, name: @buy_order.name, number_order: @buy_order.number_order, payment: @buy_order.payment }
    assert_redirected_to buy_order_path(assigns(:buy_order))
  end

  test "should destroy buy_order" do
    assert_difference('BuyOrder.count', -1) do
      delete :destroy, id: @buy_order
    end

    assert_redirected_to buy_orders_path
  end
end
