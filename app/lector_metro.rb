class LectorMetro
  attr_reader :bifurcaciones
  def initialize nombre_archivo = ""
    @nombre_archivo = nombre_archivo
    @colores_ruta = {}
    @bifurcaciones = {}
  end

  def leer_archivo nombre_archivo = @nombre_archivo
    comentarios = 0
    File.readlines(nombre_archivo).each_with_index do |line,i|
      unless line.start_with? "#"
        asignar_datos(line,i-comentarios )
      else
        comentarios += 1
      end
    end

    {
      "estacion_inicial" => @estacion_inicial,
      "estacion_final"   => @estacion_final,
      "color_de_tren"    => @color_de_tren,
      "ruta_comun"       => @ruta_comun,
      "colores_ruta"     => @colores_ruta,
      "bifurcaciones"    => @bifurcaciones
    }
  end

  private
  def asignar_datos linea,index
    linea.chomp!
    case index
    when 0
      @estacion_inicial = linea
    when 1
      @estacion_final = linea
    when 2
      @color_de_tren = linea
    when 3
      linea.split(",").each{|r| @colores_ruta.store(r,"B")}
    when 4
      linea.split(",").each{|r| @colores_ruta.store(r,"V")}
    when 5
      linea.split(",").each{|r| @colores_ruta.store(r,"R")}
    when 6
      @ruta_comun = linea
    else
      key,*value = linea.split(":")
      value += @bifurcaciones[key] if @bifurcaciones.has_key? key
      @bifurcaciones.store(key,value)
    end
  end
end
