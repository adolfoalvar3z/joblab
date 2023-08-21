class UsersController < ApplicationController
  before_action :authenticate_user! # Asegura que el usuario esté autenticado

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])

  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_path, notice: 'Usuario creado exitosamente.'
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])

  end

  def editarmicuenta
    @user = current_user
  end

  def update
    if params[:user][:password].blank? && params[:user][:password_confirmation].blank?
      # Elimina los campos de contraseña de los parámetros antes de actualizar
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end

    @user = User.find(params[:id])
    #filtered_params = user_params.except(:password, :password_confirmation, :bio, :avatar)

    if @user.update(user_params)
      redirect_to users_path, notice: 'Usuario actualizado exitosamente.'
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path, notice: 'Usuario eliminado exitosamente.'
  end

  private

  def user_params
    params.require(:user).permit(:nombre, :email, :telefono, :direccion, :cargo, :password, :password_confirmation, :bio, :avatar)
  end
end
