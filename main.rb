require_relative 'app/estacion'
require_relative 'app/lector_metro'

lector   = LectorMetro.new "inputs/input5.txt"
datos    = lector.leer_archivo
estacion = Estacion.new datos
puts datos.to_s
# abort
estacion.condiciones_de_calculo
puts "ruta óptima: #{estacion.ruta_optima.to_s}"
