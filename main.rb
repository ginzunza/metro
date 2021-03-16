require_relative 'app/estacion'
require_relative 'app/lector_metro'
5.times do |t|
  lector   = LectorMetro.new "inputs/input#{t+2}.txt"
  datos    = lector.leer_archivo
  estacion = Estacion.new datos
  puts datos.to_s
  # abort
  puts "inputs/input#{t+2}.txt"
  estacion.condiciones_de_calculo
  puts "ruta óptima: #{estacion.ruta_optima.to_s}"
end
