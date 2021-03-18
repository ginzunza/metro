require_relative '../lib/estacion'

RSpec.describe Estacion do
  before do
    @estacion = Estacion.new ruta_input
  end

  let(:ruta_input) {
    {
      "ruta_comun"   => "A,B,C,B12",
      "colores_ruta" => {
        "A" => "B", "B" => "B", "C" => "B", "D" => "B", "E" => "B", "F" => "B", "G" => "V", "I" => "V", "H" => "R"
      },
      "bifurcaciones" => {
        "B12" => [
          "G,H,I,F",
          "D,E,F"
        ]
      }
    }
  }

  describe "Instanciación de clase" do
    it "los datos se asignan correctamente en los atributos" do
      ["ruta_comun","colores_ruta","bifurcaciones"].each do |key|
        expect(@estacion.instance_variable_get(("@#{key}").to_sym)).to eq(
          ruta_input[key]
        )
      end
    end
  end

  describe "Obtención de rutas" do
    it "la ruta óptima si el tren es rojo es la correcta" do
      inicio,fin,color = ["A","F","R"]
      resultado = @estacion.ruta_optima(inicio, fin, color)
      expect(resultado).to eq "ABCHF"
    end

    it "la ruta óptima si el tren es verde es la correcta" do
      inicio,fin,color = ["A","F","V"]
      resultado = @estacion.ruta_optima(inicio, fin, color)
      expect(resultado).to eq "ABCGIF"
    end

    it "la ruta óptima si el tren es blanco es la correcta" do
      inicio,fin,color = ["A","F","B"]
      resultado = @estacion.ruta_optima(inicio, fin, color)
      expect(resultado).to eq "ABCDEF"
    end
  end
end