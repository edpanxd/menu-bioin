class Formulario < ApplicationRecord


  validates :platillo, presence: false
  validates :entrada, presence: true
  validates :guisado, presence: true
  validates :guarnicion, presence: true
  validates :nombre, presence: true
  validates :fecha, presence: true

  validates :nombre, uniqueness: { scope: :fecha, message: 'nombre por dia' }
end
