class FormulariosController < ApplicationController

  def index
    @formulario = Formulario.new
    @empleados = Empleado.all
    @hoy =Date.today
    @lunes = Platillo.where(fecha: Date.today.next_week(:monday))
    @martes = Platillo.where(fecha: Date.today.next_week(:tuesday))
    @miercoles = Platillo.where(fecha: Date.today.next_week(:wednesday))
    @jueves = Platillo.where(fecha: Date.today.next_week(:thursday))
    @viernes = Platillo.where(fecha: Date.today.next_week(:friday))

  end

  def new
   @formulario = Formulario.new
   @empleados = Empleado.all
  end

  def create

      @formulario = Formulario.new(formulario_params)
      if @formulario.save
        redirect_to formularios_path, notice: 'new'
      else
        redirect_to formularios_path, alert: 'error'
      end

  end

  def edit
    @formulario = Formulario.find(params[:id])
    @nombre = @formulario.nombre
    @empleados = Empleado.all
  end

  def update
    @formulario = Formulario.find(params[:id])

    if @formulario.update(formulario_params)
      redirect_to lista_path, notice: 'Menu Actualizado'
    else
      render :edit, status: unprocessable_entity
    end
  end

  def destroy
    @formulario = Formulario.find(params[:id])
    @formulario.destroy
    redirect_to lista_path, notice: 'proyecto eliminado'
  end

  def lista
    @formularios = Formulario.all
    @formularioss = Formulario.where(fecha: Date.today).where.not("nombre LIKE 'PL2%'").order(nombre: 'ASC')
    @formularios = Formulario.where(fecha: Date.today).where.not("nombre LIKE 'PL2%'").order(nombre: 'ASC')
    @formularios2 = Formulario.where(fecha: Date.today).where("nombre LIKE 'PL2%'").order(nombre: 'ASC')
    @enchiladas = Formulario.where(fecha: Date.today, platillo: 'Ensalada').count
    @crema = Formulario.where(fecha: Date.today, platillo: 'Enchiladas Sin Crema').count
    @lechuga = Formulario.where(fecha: Date.today, platillo: 'Enchiladas Sin Lechuga').count
    @pechuga = Formulario.where(fecha: Date.today, platillo: 'Pechuga').count
    @normal = Formulario.where(fecha: Date.today, platillo: 'Normal').count
    @cancelada = Formulario.where(fecha: Date.today, platillo: 'Cancelar').count
    @total = Formulario.where(fecha: Date.today).where.not(platillo: 'Cancelar').count
    @enchiladas_pl1 = Formulario.where(fecha: Date.today, platillo: 'Ensalada').where.not("nombre LIKE 'PL2%'").count
    @crema_pl1 = Formulario.where(fecha: Date.today, platillo: 'Enchiladas Sin Crema').where.not("nombre LIKE 'PL2%'").count
    @lechuga_pl1 = Formulario.where(fecha: Date.today, platillo: 'Enchiladas Sin Lechuga').where.not("nombre LIKE 'PL2%'").count
    @pechuga_pl1 = Formulario.where(fecha: Date.today, platillo: 'Pechuga').where.not("nombre LIKE 'PL2%'").count
    @normal_pl1 = Formulario.where(fecha: Date.today, platillo: 'Normal').where.not("nombre LIKE 'PL2%'").count
    @cancelada_pl1 = Formulario.where(fecha: Date.today, platillo: 'Cancelar').where.not("nombre LIKE 'PL2%'").count
    @total_pl1 = Formulario.where(fecha: Date.today).where.not("nombre LIKE 'PL2%'").where.not( platillo: 'Cancelar').count
    @enchiladas_pl2 = Formulario.where(fecha: Date.today, platillo: 'Ensalada').where("nombre LIKE 'PL2%'").count
    @crema_pl2 = Formulario.where(fecha: Date.today, platillo: 'Enchiladas Sin Crema').where("nombre LIKE 'PL2%'").count
    @lechuga_pl2 = Formulario.where(fecha: Date.today, platillo: 'Enchiladas Sin Lechuga').where("nombre LIKE 'PL2%'").count
    @pechuga_pl2 = Formulario.where(fecha: Date.today, platillo: 'Pechuga').where("nombre LIKE 'PL2%'").count
    @normal_pl2 = Formulario.where(fecha: Date.today, platillo: 'Normal').where("nombre LIKE 'PL2%'").count
    @cancelada_pl2 = Formulario.where(fecha: Date.today, platillo: 'Cancelar').where("nombre LIKE 'PL2%'").count
    @total_pl2 = Formulario.where(fecha: Date.today).where("nombre LIKE 'PL2%'").where.not(platillo: 'Cancelar').count
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: 'Lista', template: 'formularios/pdf.html.erb'   # Excluding ".pdf" extension.
      end
    end
  end

  private

  def formulario_params
    params.require(:formulario).permit(:platillo, :nombre, :fecha, :entrada, :guisado, :guarnicion)
  end
end
