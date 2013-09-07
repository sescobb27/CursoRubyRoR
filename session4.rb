#!/usr/bin/env ruby -wKU
# =================

Person = Struct.new :name, :age, :gender
person1 = Person.new 'Simon', 21, 'M'
person1.name
person1.age
person1.gender

# =================
Person = Struct.new :name, :age, :gender do
    def say_hi
        puts "hi from #{self.name}"
    end
end
Person = Struct.new :name, :age, :gender
person1 = Person.new 'Simon', 21, 'M'
person1.name
person1.age
person1.gender
person1.say_hi

# =================
class Person
  attr_accessor :name, :age, :gender
  def initialize(args = {})
      @name = args[:name]
      @age = args[:age]
      @gender = args[:gender]
  end

  def description
      puts "My name is #{@name}, I'm #{@age} years old and I'm #{@gender}"
  end

  def display
      puts "My name is #{@name}, I'm #{@age} years old and I'm #{@gender}"
  end
end

person1 = Person.new name: 'Simon', age: 21, gender: 'M'
person1.description
person1.display

# =================
class Person
  attr_accessor :name, :age, :gender
  def initialize(args = {})
      @name = args[:name]
      @age = args[:age]
      @gender = args[:gender]
  end

  def description
      puts "My name is #{@name}, I'm #{@age} years old and I'm #{@gender}"
  end

  alias_method :display, :description
end

person1 = Person.new name: 'Simon', age: 21, gender: 'M'
person1.description
person1.display


class Boss < Person
    alias_method :person_description, :description
    def description
        return unless authenticate!
        puts "I'm the Boss"
        person_description
        company_info
    end

  private
  def authenticate!
      puts "Performing Authentication... Please Wait..."
      true
  end
  def company_info
      puts "Private zone ..."
      puts "Only for Bosses"
  end
end

boss = Boss.new name: 'Foo Bar', age: 30, gender: 'F' 
boss.description

class Person
  alias_method :old_description, :description
  def description
      puts "custom description"
      old_description
  end
end

# =================
person1.instance_eval <<-RUBY
      def first_love
          puts "Ruby First Sight Love"
      end
    RUBY

# =================
person1.instance_eval do
      def first_love
          puts "Ruby First Sight Love"
      end

      def say_hello_to(*names)
          names.each do |person_name|
              puts "Hello #{person_name} from #{self.name}"
          end
      end
end


(0..10). each do |x|
    puts  "number is: #{x}"
end


# =================
class Numeric
    @@currencies = {'yen' => 0.34, 'euro' => 2.540, 'rupee' => 0.05, 'dollar' => 1}
    def method_missing(method_id)
        singular_currency = method_id.to_s.gsub( /s$/, '')
        if @@currencies.has_key?(singular_currency)
            self * @@currencies[singular_currency]
        else
            super
        end
    end
end

# =================
class Numeric
    @@currencies = {'yen' => 0.34, 'euro' => 2.540, 'rupee' => 0.05, 'dollar' => 1}
    def method_missing(method_id)
        singular_currency = method_id.to_s.gsub( /s$/, '')
        if @@currencies.has_key?(singular_currency)
            self * @@currencies[singular_currency]
        else
            super
        end
    end

# error
    def in(currency)
        currency.to_s.gsub!( /s$/, '')
        self / @@currencies[currency]
    end
end

# =================
class Numeric
 @@currencies = {'yen' => 0.34, 'euro' => 2.540, 'rupee' => 0.05, 'dollar' => 1}
 def method_missing(method_id)
   singular_currency = method_id.to_s.gsub( /s$/, '')
   if @@currencies.has_key?(singular_currency)
     self * @@currencies[singular_currency]
   else
     super
   end
 end

 def in(currency)
   currency = currency.to_s.gsub( /s$/, '')
   self / @@currencies[currency]
 end
end

# =================
class Numeric
  def method_missing method_name, num
      self ** num if method_name == :pow
  end
end

# =================
class Person
  attr_accessor :name, :age, :gender
  def initialize(args = {})
      @name = args[:name]
      @age = args[:age]
      @gender = args[:gender]
  end

  def description
      puts "My name is #{@name}, I'm #{@age} years old and I'm #{@gender}"
  end

  def method_missing method_name, &block
      raise "Expecting Block in #{method_name}" unless block_given?
      define_singleton_method :method_name, &block
      send :method_name
  end
end

  def method_missing method_name, &block
      raise "Expecting Block in #{method_name}" unless block_given?
      self.class.class_eval do
          define_method :method_name, &block
      end
      send :method_name
  end

simon = Person.new name: 'Simon', age: 21, gender: 'M'
simon.can_vote? {
    if @age < 18
        raise 'Too Young'
    else
        puts "You can vote"
    end
}

pepe = Person.new name: 'Pepe', age: 15, gender: 'M'
pepe.can_vote? {
    if @age < 18
        raise 'Too Young'
    else
        puts "You can vote"
    end
}

# =================
condition = Proc.new do
  if @age < 18
    raise 'Too Young'
  else
    puts "You can vote"
  end
end

simon = Person.new name: 'Simon', age: 21, gender: 'M'
simon.can_vote? &condition

pepe = Person.new name: 'Pepe', age: 15, gender: 'M'
pepe.can_vote? &condition

# =================
class Person
    attr_accessor :name, :age, :gender
    def initialize &block
        instance_eval &block
    end
end

person1 = Person.new do
    @name = "Simon"
    @age = 21
    @gender = 'M'
end
pepe = Person.new do
    @name = "Pepe"
    @age = 15
    @gender = "M"
end

# =================
class Class
    def own_reader *args
        class_eval do
            args.each do  |_attr|
                attr = _attr.to_s
                eval "def #{attr}
                  @#{attr} ||= nil
                end"
            end
        end
    end
    def own_writer *args
        class_eval do
            args.each do |_attr|
                attr = _attr.to_s
                eval "def #{attr}= attr
                  @#{attr} = attr || nil
                end"
            end
        end
    end
end

class Person
    own_reader :name, :age, :gender
    own_writer :name, :age, :gender
    def initialize &block
          instance_eval &block
    end
end

person1 = Person.new do
    @name = "Simon"
    @age = 21
    @gender = 'M'
end
pepe = Person.new do
    @name = "Pepe"
    @age = 15
    @gender = "M"
end

class Class
    def own_accessor *args
        args.each do |attr_name|
            method_name = attr_name.to_s
            class_eval %Q(
                def #{method_name}=(args)
                    @#{method_name} = args
                end

                def #{method_name}
                    @#{method_name}
                end
            )
        end
    end
end

class Person
    own_accessor :name, :age, :gender
    def initialize &block
          instance_eval &block
    end
end