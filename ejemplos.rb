f = lambda{|elem|
  puts "#{elem.class}"
}

[1,2.0,'hola',{},[],5e-3,:hola].each &f

expo = lambda{|num,expo|
  num**expo
}


f = lambda{ |x|
  eval function.gsub 'x',"#{x}"
}

f = lambda{ |x,y='hola',*args|
  eval function.gsub 'x',"#{x}"
}


class CursoRoR
  attr_accessor :miembros
  def initialize miembros
    @miembros = miembros
  end
  def each_member
    @miembros.each do |member|
      yield member
    end
  end
end

class Persona
  attr_accessor :nombre, :edad, :sexo
  def initialize(nombre, edad, sexo)
    @nombre = nombre
    @edad = edad
    @sexo = sexo
  end
end
  miembros = []
  letras = %w(a b c d e f g h i)
  6.times do
    miembros << Persona.new(letras.shuffle.join, rand(100), ['M','F'].shuffle.shift)
  end
curso = CursoRoR.new





class String
  def SAY_HELLO
    puts 'Hello'
  end
end



module Curso
  RoR = CursoRoR.new %w(pepito pepita martica)
end

