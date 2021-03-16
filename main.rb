require_relative 'app/estacion'
require_relative 'app/lector_metro'

archivo,inicio,fin,color = ARGV

lector   = LectorMetro.new archivo
datos    = lector.leer_archivo
estacion = Estacion.new datos
puts datos.to_s
# estacion.condiciones_de_calculo
ruta_optima = estacion.ruta_optima(inicio,fin,color)
puts "ruta óptima: #{ruta_optima.to_s}"

