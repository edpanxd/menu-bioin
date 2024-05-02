class FormulariosController < ApplicationController

  def index
    @formulario = Formulario.new
    @encuesta = Encuestum.new
    @empleados = Empleado.all
    @lunes = Platillo.where(fecha: Date.today.next_week(:monday))
    @martes = Platillo.where(fecha: Date.today.next_week(:tuesday))
    @miercoles = Platillo.where(fecha: Date.today.next_week(:wednesday))
    @jueves = Platillo.where(fecha: Date.today.next_week(:thursday))
    @viernes = Platillo.where(fecha: Date.today.next_week(:friday))
    @llunes = Formulario.where(fecha: Date.today.next_week(:monday))
    @lmartes = Formulario.where(fecha: Date.today.next_week(:tuesday))
    @lmiercoles = Formulario.where(fecha: Date.today.next_week(:wednesday))
    @ljueves = Formulario.where(fecha: Date.today.next_week(:thursday))
    @lviernes = Formulario.where(fecha: Date.today.next_week(:friday))
    @repartidores = Platillo.where(fecha: Date.today)
    @friday = Time.now.friday?
    @thursday = Time.now.thursday?
    @wednesday = Time.now.wednesday?
  end

  def new
   @formulario = Formulario.new
   @empleados = Empleado.all
  end

  def create
    if @formulario == true
      @formulario = Formulario.new(formulario_params)
        if @formulario.save
          redirect_to formularios_path, notice: 'new'
        else
          redirect_to formularios_path, alert: 'error'
        end
    else
      @encueta = Encuestum.new(encuesta_params)
        if @encueta.save
          redirect_to formularios_path, notice: 'new'
        else
          redirect_to formularios_path, alert: 'error'
        end
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
    @lunes = Formulario.where(fecha: Date.today.next_week(:monday))
    @entradaL1= Formulario.where(fecha: Date.today.next_week(:monday)).where(entrada: 'Entrada 1').count
    @entradaL2= Formulario.where(fecha: Date.today.next_week(:monday)).where(entrada: 'Entrada 2').count
    @guisadoL1= Formulario.where(fecha: Date.today.next_week(:monday)).where(guisado: 'Guisado 1').count
    @guisadoL2= Formulario.where(fecha: Date.today.next_week(:monday)).where(guisado: 'Guisado 2').count
    @guisadoL3= Formulario.where(fecha: Date.today.next_week(:monday)).where(guisado: 'Guisado 3').count
    @guarnicionL1= Formulario.where(fecha: Date.today.next_week(:monday)).where(guarnicion: 'Guarnición 1').count
    @guarnicionL2= Formulario.where(fecha: Date.today.next_week(:monday)).where(guarnicion: 'Guarnición 2').count
    @guarnicionL3= Formulario.where(fecha: Date.today.next_week(:monday)).where(guarnicion: 'Guarnición 3').count
    @lunes.each do |l|
      l.entrada == 'Entrada 1' && l.guisado == 'Guisado 1' && l.guarnicion == 'Guarnición 1' ? @c1 = + 1 : ''
      l.entrada == 'Entrada 1' && l.guisado == 'Guisado 2' && l.guarnicion == 'Guarnición 1' ? @c2 = + 1 : ''
      l.entrada == 'Entrada 1' && l.guisado == 'Guisado 3' && l.guarnicion == 'Guarnición 1' ? @c3 = + 1 : ''
      l.entrada == 'Entrada 1' && l.guisado == 'Guisado 1' && l.guarnicion == 'Guarnición 2' ? @c4 = + 1 : ''
      l.entrada == 'Entrada 1' && l.guisado == 'Guisado 2' && l.guarnicion == 'Guarnición 2' ? @c5 = + 1 : ''
      l.entrada == 'Entrada 1' && l.guisado == 'Guisado 3' && l.guarnicion == 'Guarnición 2' ? @c6 = + 1 : ''
      l.entrada == 'Entrada 1' && l.guisado == 'Guisado 1' && l.guarnicion == 'Guarnición 3' ? @c7 = + 1 : ''
      l.entrada == 'Entrada 1' && l.guisado == 'Guisado 2' && l.guarnicion == 'Guarnición 3' ? @c8 = + 1 : ''
      l.entrada == 'Entrada 1' && l.guisado == 'Guisado 3' && l.guarnicion == 'Guarnición 3' ? @c9 = + 1 : ''
    end
    @martes = Formulario.where(fecha: Date.today.next_week(:tuesday))
    @entradaM1= Formulario.where(fecha: Date.today.next_week(:tuesday)).where(entrada: 'Entrada 1').count
    @entradaM2= Formulario.where(fecha: Date.today.next_week(:tuesday)).where(entrada: 'Entrada 2').count
    @guisadoM1= Formulario.where(fecha: Date.today.next_week(:tuesday)).where(guisado: 'Guisado 1').count
    @guisadoM2= Formulario.where(fecha: Date.today.next_week(:tuesday)).where(guisado: 'Guisado 2').count
    @guisadoM3= Formulario.where(fecha: Date.today.next_week(:tuesday)).where(guisado: 'Guisado 3').count
    @guarnicionM1= Formulario.where(fecha: Date.today.next_week(:tuesday)).where(guarnicion: 'Guarnicion 1').count
    @guarnicionM2= Formulario.where(fecha: Date.today.next_week(:tuesday)).where(guarnicion: 'Guarnicion 2').count
    @guarnicionM3= Formulario.where(fecha: Date.today.next_week(:tuesday)).where(guarnicion: 'Guarnicion 3').count
    @miercoles = Formulario.where(fecha: Date.today.next_week(:wednesday))
    @entradaW1= Formulario.where(fecha: Date.today.next_week(:wednesday)).where(entrada: 'Entrada 1').count
    @entradaW2= Formulario.where(fecha: Date.today.next_week(:wednesday)).where(entrada: 'Entrada 2').count
    @guisadoW1= Formulario.where(fecha: Date.today.next_week(:wednesday)).where(guisado: 'Guisado 1').count
    @guisadoW2= Formulario.where(fecha: Date.today.next_week(:wednesday)).where(guisado: 'Guisado 2').count
    @guisadoW3= Formulario.where(fecha: Date.today.next_week(:wednesday)).where(guisado: 'Guisado 3').count
    @guarnicionW1= Formulario.where(fecha: Date.today.next_week(:wednesday)).where(guarnicion: 'Guarnicion 1').count
    @guarnicionW2= Formulario.where(fecha: Date.today.next_week(:wednesday)).where(guarnicion: 'Guarnicion 2').count
    @guarnicionW3= Formulario.where(fecha: Date.today.next_week(:wednesday)).where(guarnicion: 'Guarnicion 3').count
    @jueves = Formulario.where(fecha: Date.today.next_week(:thursday))
    @entradaJ1= Formulario.where(fecha: Date.today.next_week(:thursday)).where(entrada: 'Entrada 1').count
    @entradaJ2= Formulario.where(fecha: Date.today.next_week(:thursday)).where(entrada: 'Entrada 2').count
    @guisadoJ1= Formulario.where(fecha: Date.today.next_week(:thursday)).where(guisado: 'Guisado 1').count
    @guisadoJ2= Formulario.where(fecha: Date.today.next_week(:thursday)).where(guisado: 'Guisado 2').count
    @guisadoJ3= Formulario.where(fecha: Date.today.next_week(:thursday)).where(guisado: 'Guisado 3').count
    @guarnicionJ1= Formulario.where(fecha: Date.today.next_week(:thursday)).where(guarnicion: 'Guarnicion 1').count
    @guarnicionJ2= Formulario.where(fecha: Date.today.next_week(:thursday)).where(guarnicion: 'Guarnicion 2').count
    @guarnicionJ3= Formulario.where(fecha: Date.today.next_week(:thursday)).where(guarnicion: 'Guarnicion 3').count
    @viernes = Formulario.where(fecha: Date.today.next_week(:friday))
    @entradaV1= Formulario.where(fecha: Date.today.next_week(:thursday)).where(entrada: 'Entrada 1').count
    @entradaV2= Formulario.where(fecha: Date.today.next_week(:thursday)).where(entrada: 'Entrada 2').count
    @guisadoV1= Formulario.where(fecha: Date.today.next_week(:thursday)).where(guisado: 'Guisado 1').count
    @guisadoV2= Formulario.where(fecha: Date.today.next_week(:thursday)).where(guisado: 'Guisado 2').count
    @guisadoV3= Formulario.where(fecha: Date.today.next_week(:thursday)).where(guisado: 'Guisado 3').count
    @guarnicionV1= Formulario.where(fecha: Date.today.next_week(:thursday)).where(guarnicion: 'Guarnicion 1').count
    @guarnicionV2= Formulario.where(fecha: Date.today.next_week(:thursday)).where(guarnicion: 'Guarnicion 2').count
    @guarnicionV3= Formulario.where(fecha: Date.today.next_week(:thursday)).where(guarnicion: 'Guarnicion 3').count
    case params['dia']
    when 'lunes'
      @formulario = @lunes
    when 'martes'
      @formulario = @martes
    when 'miercoles'
      @formulario = @miercoles
    when 'jueves'
      @formulario = @jueves
    when 'viernes'
      @formulario = @viernes
    end
    respond_to do |format|
      format.html
      format.xlsx do
        render xlsx: 'Lista', template: 'formularios/excel'
      end
      format.pdf do
        render pdf: 'Lista', template: 'formularios/pdf.html.erb'   # Excluding ".pdf" extension.
      end
    end
  end

  private

  def lista_por_dia

  end

  def formulario_params
    params.require(:formulario).permit(:platillo, :nombre, :fecha, :entrada, :guisado, :guarnicion)
  end
  def encuesta_params
    params.require(:encuestum).permit(:pregunta_uno, :pregunta_dos, :pregunta_tres, :pregunta_cuatro, :nombre, :fecha)
  end
end
