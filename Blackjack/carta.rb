class Carta
  attr_accessor :tipo
  attr_writer :valor
  def initialize(valor, tipo)
    @tipo = tipo
    @valor = valor
  end

  def valor
    case @valor
      when is_a?(String)
        if @valor =~ /A/
          11
        else
          10
        end
      else
        @valor
    end
  end
end