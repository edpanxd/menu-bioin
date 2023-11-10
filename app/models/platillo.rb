class Platillo < ApplicationRecord

  validates :comida, presence: true

  validates :fecha, presence: true

  validates :fecha, uniqueness: { scope: :fecha, message: 'nombre por dia' }
end
