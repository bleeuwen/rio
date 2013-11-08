require 'test_helper'

class UserArtikelgroepsControllerTest < ActionController::TestCase
  setup do
    @user_artikelgroep = user_artikelgroeps(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_artikelgroeps)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_artikelgroep" do
    assert_difference('UserArtikelgroep.count') do
      post :create, user_artikelgroep: { artikelgroep_id: @user_artikelgroep.artikelgroep_id, auth_c: @user_artikelgroep.auth_c, auth_d: @user_artikelgroep.auth_d, auth_r: @user_artikelgroep.auth_r, auth_u: @user_artikelgroep.auth_u, user_id: @user_artikelgroep.user_id }
    end

    assert_redirected_to user_artikelgroep_path(assigns(:user_artikelgroep))
  end

  test "should show user_artikelgroep" do
    get :show, id: @user_artikelgroep
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user_artikelgroep
    assert_response :success
  end

  test "should update user_artikelgroep" do
    patch :update, id: @user_artikelgroep, user_artikelgroep: { artikelgroep_id: @user_artikelgroep.artikelgroep_id, auth_c: @user_artikelgroep.auth_c, auth_d: @user_artikelgroep.auth_d, auth_r: @user_artikelgroep.auth_r, auth_u: @user_artikelgroep.auth_u, user_id: @user_artikelgroep.user_id }
    assert_redirected_to user_artikelgroep_path(assigns(:user_artikelgroep))
  end

  test "should destroy user_artikelgroep" do
    assert_difference('UserArtikelgroep.count', -1) do
      delete :destroy, id: @user_artikelgroep
    end

    assert_redirected_to user_artikelgroeps_path
  end
end
