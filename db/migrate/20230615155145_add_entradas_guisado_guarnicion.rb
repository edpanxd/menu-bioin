class AddEntradasGuisadoGuarnicion < ActiveRecord::Migration[6.1]
  def change
    add_column :formularios, :entrada, :string
    add_column :formularios, :guisado, :string
    add_column :formularios, :guarnicion, :string
  end
end
