require "application_system_test_case"

class PostulacionsTest < ApplicationSystemTestCase
  setup do
    @postulacion = postulacions(:one)
  end

  test "visiting the index" do
    visit postulacions_url
    assert_selector "h1", text: "Postulacions"
  end

  test "should create postulacion" do
    visit postulacions_url
    click_on "New postulacion"

    fill_in "Estado", with: @postulacion.estado
    fill_in "Oferta", with: @postulacion.oferta_id
    fill_in "Resultado", with: @postulacion.resultado
    fill_in "User", with: @postulacion.user_id
    click_on "Create Postulacion"

    assert_text "Postulacion was successfully created"
    click_on "Back"
  end

  test "should update Postulacion" do
    visit postulacion_url(@postulacion)
    click_on "Edit this postulacion", match: :first

    fill_in "Estado", with: @postulacion.estado
    fill_in "Oferta", with: @postulacion.oferta_id
    fill_in "Resultado", with: @postulacion.resultado
    fill_in "User", with: @postulacion.user_id
    click_on "Update Postulacion"

    assert_text "Postulacion was successfully updated"
    click_on "Back"
  end

  test "should destroy Postulacion" do
    visit postulacion_url(@postulacion)
    click_on "Destroy this postulacion", match: :first

    assert_text "Postulacion was successfully destroyed"
  end
end
