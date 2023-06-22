class PlatillosController < ApplicationController

  def index
    @platillos = Platillo.all.order(fecha: :desc).paginate(page: params[:page], per_page: 3)
  end

  def show

  end

  def new
    @platillo = Platillo.new
    @empleados = Empleado.all
  end

  def create

    @platillo= Platillo.new(platillo_params)

    if @platillo.save
      redirect_to platillos_path, notice: 'nuevo'
    else
      redirect_to new_platillo_path, alert: 'error'
    end


  end

  def edit
    @platillo = Platillo.find(params[:id])
    @repa1 = @platillo.repartidor_1
    @repa2 = @platillo.repartidor_2
    @empleados = Empleado.all
  end

  def update
    @platillo = Platillo.find(params[:id])

    if @platillo.update(platillo_params)
      redirect_to platillos_path, notice: "Menu Actualizado"
    else
      render :edit, status: unprocessable_entity
    end
  end

  def destroy
    @platillo = Platillo.find(params[:id])
    @platillo.destroy
    redirect_to platillos_path, notice: "proyecto eliminado"
  end

  private

  def platillo_params
    params.require(:platillo).permit(:comida, :repartidor_1, :repartidor_2, :fecha)
  end
end
