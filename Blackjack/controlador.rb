require File.expand_path 'jugador.rb'
require File.expand_path 'mazo.rb'
class Controlador
  def initialize jugadores, mazo
    @jugadores,@mazo= jugadores, mazo
    start
  end

  private
  def start
    @jugadores.each do |jugador|
      if pedir_carta?
        jugador.nueva_carta = @mazo.repartir_carta
      else
        jugador.estado = Jugador.estados[:plantado]
      end
    end
  end

  def pedir_carta?
    puts 'Desea Carta o se planta?'
    ans = gets.chomp
    ans =~ /yes|y/i
  end
end

mazo = Mazo.new
jugadores = []
puts "Cantidad Jugadores:"
num_jugadores = gets.to_i

num_jugadores.times do
  puts "Nombre:"
  name = gets.chomp
  mano = Mano.new mazo.repartir_carta, mazo.repartir_carta
  jugador = Jugador.new name, mano
  jugadores.push jugador
end
mano_dealer = Mano.new mazo.repartir_carta, mazo.repartir_carta
jugadores.push Dealer.new 'Dealer', mano_dealer

Controlador.new jugadores, mazo