class Postulacion < ApplicationRecord
  belongs_to :user
  belongs_to :oferta, class_name: 'Ofertum'
end
