require_relative '../lib/lector_metro'

RSpec.describe LectorMetro do
  describe "Apertura archivo" do

    let(:datos_correctos) {
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

    before do
      @lector = LectorMetro.new "inputs/input.txt"
      @datos  = @lector.leer_archivo
    end

    context "archivo existente y válido" do
      it "retorna parámetros esperados" do
        expect(@datos.keys).to match_array([
          "ruta_comun", "colores_ruta", "bifurcaciones"
        ])
      end

      it "retorna valores esperados" do
        ["ruta_comun","colores_ruta","bifurcaciones"].each do |key|
          expect(@datos[key]).to eq(
            datos_correctos[key]
          )
        end
      end
    end

    context "archivo existente e inválido" do
      
    end

    context "archivo inexistente" do
      it "gatilla error" do
        expect{@lector.leer_archivo("ruta_inexistente")}.to raise_error(Errno::ENOENT)
      end
    end
  end
end