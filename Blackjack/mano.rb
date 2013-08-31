dir = File.expand_path 'carta.rb'
require "#{dir}"
class Mano
  def initialize carta1, carta2
    @carta1, @carta2 = carta1, carta2
    @cartas = [@carta1, @carta2]
  end

  def agregar_carta carta
    @cartas.push carta
  end
end