class CreateEmpleados < ActiveRecord::Migration[6.1]
  def change
    create_table :empleados do |t|
      t.string :nombre
      t.string :area
      t.timestamps
    end
  end
end
