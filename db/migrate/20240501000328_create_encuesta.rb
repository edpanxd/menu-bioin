class CreateEncuesta < ActiveRecord::Migration[7.0]
  def change
    create_table :encuesta do |t|
      t.string :pregunta_uno
      t.string :pregunta_dos
      t.string :pregunta_tres
      t.string :pregunta_cuatro
      t.string :nombre
      t.date :fecha
      t.timestamps
    end
  end
end
