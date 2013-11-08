require 'test_helper'

class OrderRegelsControllerTest < ActionController::TestCase
  setup do
    @order_regel = order_regels(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:order_regels)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create order_regel" do
    assert_difference('OrderRegel.count') do
      post :create, order_regel: { Opmerking: @order_regel.Opmerking, aantal: @order_regel.aantal, artikel_id: @order_regel.artikel_id, order_id: @order_regel.order_id }
    end

    assert_redirected_to order_regel_path(assigns(:order_regel))
  end

  test "should show order_regel" do
    get :show, id: @order_regel
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @order_regel
    assert_response :success
  end

  test "should update order_regel" do
    patch :update, id: @order_regel, order_regel: { Opmerking: @order_regel.Opmerking, aantal: @order_regel.aantal, artikel_id: @order_regel.artikel_id, order_id: @order_regel.order_id }
    assert_redirected_to order_regel_path(assigns(:order_regel))
  end

  test "should destroy order_regel" do
    assert_difference('OrderRegel.count', -1) do
      delete :destroy, id: @order_regel
    end

    assert_redirected_to order_regels_path
  end
end
