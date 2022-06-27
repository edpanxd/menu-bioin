class FormulariosController < ApplicationController

  def index
    @platillos = Platillo.where(fecha: Date.today)
    @formulario = Formulario.new
    @empleados = Empleado.all
    @a= Time.now
    @foto1 = ""
    @foto2 = ""
    @platillos.each do |f|
      @empleados.each do |h|
        if f.repartidor_1 == h.nombre
          @foto1 = h.imagen
        @area1=h.area
        end

        if f.repartidor_2 == h.nombre
          @foto2 = h.imagen
          @area2 =h.area
        end
      end
    end
  end

  def new
   @formulario = Formulario.new
   @empleados = Empleado.all
  end

  def create
    if Time.now < Time.parse("17:30")
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
    @enchiladas_pl1 = Formulario.where(fecha: Date.today, platillo: 'Enchiladas').where.not("nombre LIKE 'PL2%'").count
    @crema_pl1 = Formulario.where(fecha: Date.today, platillo: 'Enchiladas Sin Crema').where.not("nombre LIKE 'PL2%'").count
    @lechuga_pl1 = Formulario.where(fecha: Date.today, platillo: 'Enchiladas Sin Lechuga').where.not("nombre LIKE 'PL2%'").count
    @pechuga_pl1 = Formulario.where(fecha: Date.today, platillo: 'Pechuga asada').where.not("nombre LIKE 'PL2%'").count
    @normal_pl1 = Formulario.where(fecha: Date.today, platillo: 'Normal').where.not("nombre LIKE 'PL2%'").count
    @enchiladas_pl2 = Formulario.where(fecha: Date.today, platillo: 'Enchiladas').where("nombre LIKE 'PL2%'").count
    @crema_pl2 = Formulario.where(fecha: Date.today, platillo: 'Enchiladas Sin Crema').where("nombre LIKE 'PL2%'").count
    @lechuga_pl2 = Formulario.where(fecha: Date.today, platillo: 'Enchiladas Sin Lechuga').where("nombre LIKE 'PL2%'").count
    @pechuga_pl2 = Formulario.where(fecha: Date.today, platillo: 'Pechuga asada').where("nombre LIKE 'PL2%'").count
    @normal_pl2 = Formulario.where(fecha: Date.today, platillo: 'Normal').where("nombre LIKE 'PL2%'").count
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
