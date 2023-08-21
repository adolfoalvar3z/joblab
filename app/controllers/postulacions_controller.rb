class PostulacionsController < ApplicationController
  before_action :set_postulacion, only: %i[ show edit update destroy ]

  # GET /postulacions or /postulacions.json
  def index
    @postulacions_grouped = Postulacion.all.group_by(&:oferta_id)

  end

  # GET /postulacions/1 or /postulacions/1.json
  def show
  end

  # GET /postulacions/new
  def new
    @postulacion = Postulacion.new
  end

def mispostulaciones
  @postulaciones = Postulacion.where(user_id: current_user.id)
end

  # GET /postulacions/1/edit
  def edit
  end

  # POST /postulacions or /postulacions.json
  def create
    @postulacion = Postulacion.new(postulacion_params)

    respond_to do |format|
      if @postulacion.save
        format.html { redirect_to postulacion_url(@postulacion), notice: "Postulacion was successfully created." }
        format.json { render :show, status: :created, location: @postulacion }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @postulacion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /postulacions/1 or /postulacions/1.json
  def update
    respond_to do |format|
      if @postulacion.update(postulacion_params)
        format.html { redirect_to postulacion_url(@postulacion), notice: "Postulacion was successfully updated." }
        format.json { render :show, status: :ok, location: @postulacion }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @postulacion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /postulacions/1 or /postulacions/1.json
  def destroy
    @postulacion.destroy

    respond_to do |format|
      format.html { redirect_to postulacions_url, notice: "Postulacion was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_postulacion
      @postulacion = Postulacion.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def postulacion_params
      params.require(:postulacion).permit(:user_id, :oferta_id, :estado, :resultado)
    end
end
