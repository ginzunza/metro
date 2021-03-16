class Estacion
  def initialize args = {}
    args.each do |key,value|
      instance_variable_set("@#{key}",value)
    end
  end

  def ruta_optima(estacion_inicial = @estacion_inicial,ruta = @ruta_comun, profundidad = 0)
    ruta       = ruta.split ","
    inicio     = ruta.find_index estacion_inicial
    estaciones = ""

    ruta[inicio..ruta.length].each_with_index do |r,i|
      unless es_bifurcacion? r
        estaciones << r if es_estacion?(r) || @color_de_tren == 'B'
      else
        minimo_local = "A"*9999
        @bifurcaciones[r].each do |b|
          camino = ruta_optima(b[0],b, profundidad + 1)
          if camino.length < minimo_local.length && camino.include?(@estacion_final)
            minimo_local = camino 
          end
        end
        estaciones << minimo_local
      end
      break if r == @estacion_final
    end

    if profundidad == 0
      return estaciones[estaciones.index(estacion_inicial)..] if estaciones.length < 9999
      "No hay"
    else
      estaciones
    end
  end

  def condiciones_de_calculo
    puts "Estacion inicial: #{@estacion_inicial}"
    puts "Estacion final: #{@estacion_final}"
    puts "Color del tren: #{@color_de_tren}"
  end

  private
  def es_estacion? estacion
    [@color_de_tren,"B"].include? @colores_ruta[estacion]
  end
  
  def es_bifurcacion? estacion
    estacion.match?(/B\d\d/)
  end
end