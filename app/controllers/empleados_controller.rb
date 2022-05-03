class EmpleadosController < ApplicationController

  def index
    @empleados = Empleado.all
  end

  def show

  end

  def new
    @empleado = Empleado.new
  end

  def create

    @empleado= Empleado.new(empleado_params)

    if @empleado.save
      redirect_to empleados_path, notice: 'nuevo'
    else
      render :new, status: :unprocessable_entity
    end

  end

  def edit
    @empleado = Empleado.find(params[:id])
  end

  def update
    @empleado = Empleado.find(params[:id])

    if @empleado.update(empleado_params)
      redirect_to empleados_path, notice: 'Actualizado'
    else
      render :edit, status: unprocessable_entity
    end
  end

  def destroy
    @empleado = Empleado.find(params[:id])
    @empleado.destroy
    redirect_to empleados_path, notice: "Eliminado"
  end

  private

  def empleado_params
    params.require(:empleado).permit(:nombre, :area, :imagen)
  end
end
