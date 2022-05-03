class CreateFormularios < ActiveRecord::Migration[6.1]
  def change
    create_table :formularios do |t|
      t.string :platillo
      t.string :nombre
      t.date :fecha

      t.timestamps
    end
  end
end
