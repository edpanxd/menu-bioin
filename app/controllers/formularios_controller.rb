class FormulariosController < ApplicationController

  def index
    @platillos = Platillo.where(fecha: Date.today)
    @formulario = Formulario.new
    @empleados = Empleado.all
    @a = Time.now
    @platillos.each do |f|
      @empleados.each do |h|
        f.repartidor_1 == h.nombre ? @area1=h.area :
        f.repartidor_2 == h.nombre ? @area2 =h.area : next
      end
    end
    @lista = Formulario.where(fecha: Date.today).order(nombre: 'ASC')
    @semana = Platillo.all.order(id: :desc)
    @dias = []
    @semana.each_with_index do |dia, index|
      index <= 4 ? @dias.push(dia.comida+"\r\n \r\n#{dia.repartidor_1}"+"\r\n#{dia.repartidor_2}") : next
    end
  end

  def new
   @formulario = Formulario.new
   @empleados = Empleado.all
  end

  def create
    if Time.now < Time.parse("10:30")
      @formulario = Formulario.new(formulario_params)
      if @formulario.save
        redirect_to formularios_path, notice: 'new'
      else
        redirect_to formularios_path, alert: 'error'
      end
    else
      redirect_to formularios_path, alert: 'time'
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
    @formularios = Formulario.where(fecha: Date.today).where.not("nombre LIKE 'PL2%'").order(nombre: 'ASC')
    @formularios2 = Formulario.where(fecha: Date.today).where("nombre LIKE 'PL2%'").order(nombre: 'ASC')
    @enchiladas = Formulario.where(fecha: Date.today, platillo: 'Enchiladas').count
    @crema = Formulario.where(fecha: Date.today, platillo: 'Enchiladas Sin Crema').count
    @lechuga = Formulario.where(fecha: Date.today, platillo: 'Enchiladas Sin Lechuga').count
    @pechuga = Formulario.where(fecha: Date.today, platillo: 'Pechuga asada').count
    @normal = Formulario.where(fecha: Date.today, platillo: 'Normal').count
    @cancelada = Formulario.where(fecha: Date.today, platillo: 'Cancelar').count
    @total = Formulario.where(fecha: Date.today).where.not(platillo: 'Cancelar').count
    @enchiladas_pl1 = Formulario.where(fecha: Date.today, platillo: 'Enchiladas').where.not("nombre LIKE 'PL2%'").count
    @crema_pl1 = Formulario.where(fecha: Date.today, platillo: 'Enchiladas Sin Crema').where.not("nombre LIKE 'PL2%'").count
    @lechuga_pl1 = Formulario.where(fecha: Date.today, platillo: 'Enchiladas Sin Lechuga').where.not("nombre LIKE 'PL2%'").count
    @pechuga_pl1 = Formulario.where(fecha: Date.today, platillo: 'Pechuga asada').where.not("nombre LIKE 'PL2%'").count
    @normal_pl1 = Formulario.where(fecha: Date.today, platillo: 'Normal').where.not("nombre LIKE 'PL2%'").count
    @cancelada_pl1 = Formulario.where(fecha: Date.today, platillo: 'Cancelar').where.not("nombre LIKE 'PL2%'").count
    @total_pl1 = Formulario.where(fecha: Date.today).where.not("nombre LIKE 'PL2%'").where.not( platillo: 'Cancelar').count
    @enchiladas_pl2 = Formulario.where(fecha: Date.today, platillo: 'Enchiladas').where("nombre LIKE 'PL2%'").count
    @crema_pl2 = Formulario.where(fecha: Date.today, platillo: 'Enchiladas Sin Crema').where("nombre LIKE 'PL2%'").count
    @lechuga_pl2 = Formulario.where(fecha: Date.today, platillo: 'Enchiladas Sin Lechuga').where("nombre LIKE 'PL2%'").count
    @pechuga_pl2 = Formulario.where(fecha: Date.today, platillo: 'Pechuga asada').where("nombre LIKE 'PL2%'").count
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
    params.require(:formulario).permit(:platillo, :nombre, :fecha)
  end
end
