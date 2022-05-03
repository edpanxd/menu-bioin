class Empleado < ApplicationRecord
  validates :nombre, presence: true
  validates :area, presence: true
  validates :imagen, presence: true
  validates :nombre, uniqueness: true

  has_one_attached :imagen
end
