#!/usr/bin/env ruby -wKU
dir = File.expand_path 'mano.rb'
require "#{dir}"
class Jugador
  @@ESTADOS = {
    plantado: 'Plantado',
    perdio: 'Perdio',
    pedir: 'Pedir',
    espera: 'Espera'
  }
  attr_accessor :estado
  def initialize name, mano
    @name, @mano = name, mano
    @estado = @@ESTADOS[:espera]
  end

  def self.estados
    @@ESTADOS    
  end

  def nueva_carta= carta
    @mano.agregar_carta carta
  end
end

class Dealer < Jugador
  def initialize
    
  end
end