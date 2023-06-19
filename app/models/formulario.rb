class Formulario < ApplicationRecord


  validates :platillo, presence: false
  validates :nombre, presence: true
  validates :fecha, presence: true

  validates :nombre, uniqueness: { scope: :fecha, message: 'nombre por dia' }
end
