
# (attr) | attr | attr = nil | attr = {} | *attr
def nombre_metodo attr
  return attr || attr || ultima_expresion
end

# si retorna (true || false) por estandar el metodo debe ser llamado con '?' al final
def is_saturday?
  Time.now.saturday?
end
def is_friday?
  Time.now.friday?
end

# TODO es una llamada a un metodo
# %w() es la forma mas facil de crear un arreglo de strings
'Hello World'.__send__ :split, ' '
%w(wata gata pitus berry).__send__ :join
'12345'.__send__ :to_i
12345.__send__ :to_s


# lambdas o funciones anonimas
f = lambda{ |x|
  eval function.gsub 'x', "#{x}"
}
# y se invoca asi
f.call 13



lamb = lambda{ |elem|
  puts "#{elem.class}"
}
[1,2e-5,3.0,"hola",:hi,{},[],true].each &lamb
lamb2 = lambda{|x, y=42, *other|}
lamb2.parameters



proc = Proc.new{ |elem|
  puts "#{elem.class}"
}
# los procs ignoran los parametros extra
proc {|a,b| [a,b] }.call(1,2,3)
# pero los sobrantes los asigna a nil
proc {|a,b| [a,b] }.call(1)

def recorrer &block
  [1,2e-5,3.0,"hola",:hi,{},[],true].each do |elem|
    block.call elem
  end
  puts 'Finish'
end



class CursoRoR
  def initialize *participantes
    @miembros = participantes
  end
  def miembros
    puts 'Buenos Dias'
    @miembros.each do |nombre|
      puts "#{nombre}"
    end
  end
end



CursoRoR.new 'Simon', 'Valentina', 'Andres'


class CursoRoR
  attr_reader :miembros
  def initialize *participantes
    @miembros = participantes
  end
end


class CursoRoR
  def initialize
  end
  def miembros= personas
    @miembros = personas
  end
end



class CursoRoR
  attr_writer :miembros
end



class CursoRoR
  attr_accessor :miembros
end


