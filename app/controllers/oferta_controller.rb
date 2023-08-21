class OfertaController < ApplicationController
  before_action :set_ofertum, only: %i[ show edit update destroy ]

  # GET /oferta or /oferta.json
  def index
    @oferta = Ofertum.all
  end

  # GET /oferta/1 or /oferta/1.json
  def show
  end

  def solicitar
    #Ofertum.find(params[:id])
    if current_user.role != "g0d"
      usuario_postulo_cargo = Postulacion.where(user_id: current_user.id, oferta_id: params[:id]).exists?
      if usuario_postulo_cargo == false
        @oferta = params[:id] #traigo ID de la oferta laboral
        @user = current_user.id #traigo ID del usuario logueado
        Postulacion.create(oferta_id: @oferta, user_id: @user) #Genero la postulacion
        flash[:notice] = "¡Has sido postulado exitosamente a la oferta!"
        redirect_to root_path
      else
        flash[:alert] = "¡Ya has sido postulado a esta oferta!"
        redirect_to root_path
      end
    end
  end

  # GET /oferta/new
  def new
    @ofertum = Ofertum.new
  end

  # GET /oferta/1/edit
  def edit
  end

  # POST /oferta or /oferta.json
  def create
    @ofertum = Ofertum.new(ofertum_params)

    respond_to do |format|
      if @ofertum.save
        format.html { redirect_to ofertum_url(@ofertum), notice: "Ofertum was successfully created." }
        format.json { render :show, status: :created, location: @ofertum }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @ofertum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /oferta/1 or /oferta/1.json
  def update
    respond_to do |format|
      if @ofertum.update(ofertum_params)
        format.html { redirect_to ofertum_url(@ofertum), notice: "Ofertum was successfully updated." }
        format.json { render :show, status: :ok, location: @ofertum }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @ofertum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /oferta/1 or /oferta/1.json
  def destroy
    @ofertum.destroy

    respond_to do |format|
      format.html { redirect_to oferta_url, notice: "Ofertum was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ofertum
      @ofertum = Ofertum.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def ofertum_params
      params.require(:ofertum).permit(:cargo, :descripcion, :rango, :estado)
    end
end
