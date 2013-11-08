require 'test_helper'

class ArtikelgroepsControllerTest < ActionController::TestCase
  setup do
    @artikelgroep = artikelgroeps(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:artikelgroeps)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create artikelgroep" do
    assert_difference('Artikelgroep.count') do
      post :create, artikelgroep: { groepcode: @artikelgroep.groepcode, omschrijving: @artikelgroep.omschrijving, opmerking: @artikelgroep.opmerking }
    end

    assert_redirected_to artikelgroep_path(assigns(:artikelgroep))
  end

  test "should show artikelgroep" do
    get :show, id: @artikelgroep
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @artikelgroep
    assert_response :success
  end

  test "should update artikelgroep" do
    patch :update, id: @artikelgroep, artikelgroep: { groepcode: @artikelgroep.groepcode, omschrijving: @artikelgroep.omschrijving, opmerking: @artikelgroep.opmerking }
    assert_redirected_to artikelgroep_path(assigns(:artikelgroep))
  end

  test "should destroy artikelgroep" do
    assert_difference('Artikelgroep.count', -1) do
      delete :destroy, id: @artikelgroep
    end

    assert_redirected_to artikelgroeps_path
  end
end
