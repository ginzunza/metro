require_relative 'estacion'
require_relative 'lector_metro'

lector   = LectorMetro.new "input5.txt"
datos    = lector.leer_archivo
estacion = Estacion.new datos
puts datos.to_s
# abort
estacion.condiciones_de_calculo
puts "ruta óptima: #{estacion.ruta_optima.to_s}"
