require "test_helper"

class OfertaControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @ofertum = oferta(:two)
  end

  test "should get index" do
    sign_in users(:two)
    get welcome_url
    assert_response :success
  end

  test "should get new" do
    sign_in users(:two)

    get new_ofertum_url
    assert_response :success
  end

  test "should create ofertum" do
    sign_in users(:two)

    assert_difference("Ofertum.count") do
      post oferta_url, params: { ofertum: { cargo: @ofertum.cargo, descripcion: @ofertum.descripcion, rango: @ofertum.rango } }
    end

    assert_redirected_to oferta_url(Ofertum.last)
  end

  test "should show ofertum" do
    sign_in users(:two)

    get ofertum_url(@ofertum)
    assert_response :success
  end

  test "should get edit" do
    sign_in users(:two)

    get edit_ofertum_url(@ofertum)
    assert_response :success
  end

  test "should update ofertum" do
    sign_in users(:two)

    patch ofertum_url(@ofertum), params: { ofertum: { cargo: @ofertum.cargo, descripcion: @ofertum.descripcion, rango: @ofertum.rango, estado: @ofertum.estado } }
    assert_redirected_to ofertum_url(@ofertum)
  end

  test "should destroy ofertum" do
    sign_in users(:one)
    assert_difference("Ofertum.count", -1) do
      delete ofertum_url(@ofertum)
    end
    assert_redirected_to ofertum_url
  end

  test "should get solicitar" do
    sign_in users(:two)
    post solicitar_ofertum_url(@ofertum)  # Asegúrate de que esta ruta esté definida en tus rutas
    assert_response :success
  end
end
