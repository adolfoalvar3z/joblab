class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable, :validatable

  has_one_attached :avatar #para trabajar con active storage

  # Validaciones
  validates :role, inclusion: { in: %w[usuario g0d] }
  # Enum de roles
  enum role: {usuario: 'usuario', g0d: 'g0d'}, _default: 'usuario'

  def full_name
    nombre.blank? ? email : nombre
  end

  has_many :postulacion, dependent: :destroy
end
