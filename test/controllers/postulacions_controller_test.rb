require "test_helper"

class PostulacionsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @one = postulacions(:one)
    @two = postulacions(:two)
    @tres = postulacions(:tres)
    @cuatro = postulacions(:cuatro)
  end

  test "should get index" do
    sign_in users(:two)
    get postulacions_url
    assert_response :success
  end

  test "should get new" do
    sign_in users(:two)

    get new_postulacion_url
    assert_response :success
  end

  test "should create postulacion" do
    sign_in users(:two)
    assert_difference("Postulacion.count") do
      post postulacions_url, params: { postulacion: { oferta_id: @one.oferta_id, user_id: @one.user_id } }
    end
    assert_redirected_to postulacion_url(Postulacion.last)
  end

  test "should show postulacion" do
    sign_in users(:one)
    get postulacions_url(@one)
    assert_response :success
  end

  test "should get edit" do
    sign_in users(:two)

    get edit_postulacion_url(@one)
    assert_response :success
  end

  test "should update postulacion" do
    sign_in users(:two)
    patch postulacion_url(@one), params: { postulacion: { oferta_id: @one.oferta_id, user_id: @two.user_id } }
    assert_redirected_to postulacion_url(@one)
  end

  test "should destroy postulacion" do
    sign_in users(:two)

    assert_difference("Postulacion.count", -1) do
      delete postulacion_url(@one)
    end

    assert_redirected_to postulacions_url
  end
end
