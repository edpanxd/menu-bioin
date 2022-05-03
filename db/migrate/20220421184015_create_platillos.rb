class CreatePlatillos < ActiveRecord::Migration[6.1]
  def change
    create_table :platillos do |t|
      t.string :comida
      t.string :repartidor_1
      t.string :repartidor_2
      t.date :fecha

      t.timestamps
    end
  end
end
