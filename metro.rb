require_relative 'lib/estacion'
require_relative 'lib/lector_metro'

archivo,inicio,fin,color = ARGV
color  ||= "B"
lector   = LectorMetro.new archivo
ruta     = lector.leer_archivo
estacion = Estacion.new ruta

ruta_optima = estacion.ruta_optima(inicio,fin,color)

puts "ruta óptima: #{ruta_optima.to_s}"
