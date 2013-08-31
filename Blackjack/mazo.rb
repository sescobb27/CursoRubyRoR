dir = File.expand_path 'carta.rb'
require "#{dir}"
class Mazo
  attr_reader :mazo
  def initialize
    @mazo = []
    tipos = %w(D C T P) # => ['D','C','T', 'P']
    1.upto 13 do |x|
      tipos.each do |tipo|
        @mazo.push Carta.new x, tipo
      end
    end
    @mazo.shuffle!
  end

  def repartir_carta
    @mazo.shift
  end
end