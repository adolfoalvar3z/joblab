require "test_helper"

class PostulacionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @postulacion = postulacions(:one)
  end

  test "should get index" do
    get postulacions_url
    assert_response :success
  end

  test "should get new" do
    get new_postulacion_url
    assert_response :success
  end

  test "should create postulacion" do
    assert_difference("Postulacion.count") do
      post postulacions_url, params: { postulacion: { estado: @postulacion.estado, oferta_id: @postulacion.oferta_id, resultado: @postulacion.resultado, user_id: @postulacion.user_id } }
    end

    assert_redirected_to postulacion_url(Postulacion.last)
  end

  test "should show postulacion" do
    get postulacion_url(@postulacion)
    assert_response :success
  end

  test "should get edit" do
    get edit_postulacion_url(@postulacion)
    assert_response :success
  end

  test "should update postulacion" do
    patch postulacion_url(@postulacion), params: { postulacion: { estado: @postulacion.estado, oferta_id: @postulacion.oferta_id, resultado: @postulacion.resultado, user_id: @postulacion.user_id } }
    assert_redirected_to postulacion_url(@postulacion)
  end

  test "should destroy postulacion" do
    assert_difference("Postulacion.count", -1) do
      delete postulacion_url(@postulacion)
    end

    assert_redirected_to postulacions_url
  end
end
