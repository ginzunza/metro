require "byebug"

class Estacion
  def initialize args = {}
    args.each do |key,value|
      instance_variable_set("@#{key}",value)
    end
  end

  def ruta_optima(estacion_inicial, estacion_final, color_de_tren, ruta = @ruta_comun, profundidad = 0, estaciones = "")
    ruta       = ruta.split ","
    estaciones = estaciones.dup

    ruta.each do |r|
      unless es_bifurcacion? r
        next unless (estaciones + r).include?(estacion_inicial)
        estaciones << r if es_estacion?(r,color_de_tren)
      else
        minimo_local = "A"*9999
        @bifurcaciones[r].each do |b|
          camino = ruta_optima(estacion_inicial, estacion_final, color_de_tren, b, profundidad + 1, estaciones)
          # byebug
          minimo_local = camino  if es_mejor_ruta?(camino,minimo_local,estacion_final)
        end
        estaciones = minimo_local
      end
      break if r == estacion_final
    end

    if profundidad == 0
      return estaciones if camino_valido?(estaciones, estacion_inicial, estacion_final)
      "No hay"
    else
      estaciones
    end
  end

  private
  def es_estacion? estacion, color_de_tren
    color_de_tren == 'B' || [color_de_tren,"B"].include?(@colores_ruta[estacion])
  end
  
  def es_bifurcacion? estacion
    estacion.match?(/B\d\d/)
  end

  def camino_valido? camino, estacion_inicial, estacion_final
    camino.length < 9999 && camino.include?(estacion_inicial) && camino.include?(estacion_final) 
  end

  def es_mejor_ruta? camino, minimo_local, estacion_final
    camino.length < minimo_local.length && camino.include?(estacion_final)
  end
end