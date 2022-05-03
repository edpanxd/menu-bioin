class Platillo < ApplicationRecord

  validates :comida, presence: true
  validates :repartidor_1, presence: true
  validates :repartidor_2, presence: true
  validates :fecha, presence: true
end
