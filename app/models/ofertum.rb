class Ofertum < ApplicationRecord
  has_many :postulacion, dependent: :destroy
end
