
# Comprehensive Ruby Programming
# Jordan Hudgens, Packt Publishing

# Ruby proporciona el condicional 'unless' el cual es sencillamente el inverso de 'if'
# es decir, con una condicional falsa se ejecuta el cuerpo de código que circunda ...
# Para tener un condicional compuesto se utilizan los operadores && (and) y || (or).
# Normalmente se verán acompañados de ==, >, <, >=, <=, !=

x = 10
y = 100
z = 10

if x == y
  puts "x is equal to y"
elsif x > z
  puts "x is greater than z"
else
  puts "Something else"
end

players = ["Correa", "Carter", "Altuve"]

unless players.empty?
  players.each{ |player| puts player }
end

players.each{ |player| } unless players.empty?
players.each{ |player| } if !players.empty?

# En otros lenguajes de programación es necesario crear métodos getter/setter (p.e. Java)
# Ruby proporciona 'atributos de acceso', herramienta que permite simplificar definiciones ...
# El constructor de una clase viene definido por el método 'initialize'
# Si deseamos tener un valor opcional en el constructor se puede asignar en la definición (=)

class ApiConnector
  attr_accessor :title, :description, :url

  def initialize(title, description, url = "www.google.com.mx")
    @title = title
    @description = description
    @url = url
  end

  def summary
    puts  "Title: #{title}"
    puts  "URL: #{url}"
    puts  "Description: #{description}"
  end
end

api_instance = ApiConnector.new("Dionisos", "Descripción del sitio :P")
api_instance.summary

# Es posible asignar nombres a los argumentos en Ruby
# para efecto de utilizar los métodos sin necesidad de recordar el orden de los mismos.
# Algo importante a notar es que los dos puntos (:) como nombre de argumento van de sufijo,
# mientras que al definir un atributo van como prefijo!

class Person
  attr_accessor :name, :surname, :nickname

  def initialize (name:, surname:, nickname: "Kaiser")
    @name = name
    @surname = surname
    @nickname = nickname
  end

  def testing_initializer
    puts  "#{name} #{surname} '#{nickname}'"
  end
end

instancia_persona = Person.new(nickname: "Dionisos", name: "Carlos", surname: "Soria")
instancia_persona.testing_initializer

# La herencia de clases nos permite construir jerarquías, a efecto de compartir
# responsabilidades y también de evitar duplicidad innecesaria de código.
# Las clases derivadas consiguen acceso al conjunto completo de elementos del padre.
# Una regla en OOP es asegurarse que una clase esté a cargo de una sola responsabilidad!

class SmsConnector < ApiConnector
  def send_sms
    puts "Sending SMS message with the title '#{@title}' and text: #{@description}"
  end
end

sms = SmsConnector.new("Hi there!", "I'm in a SMS message")
sms.send_sms

# En diseño OOP un método público es aquel del cual se espera que no cambie fácilmente;
# la razón es porque son visibles para otros clientes y desatarían un efecto domino.
# Para ello se diseña con métodos privados los cuales sí podemos modificar sin repercusiones!
# Como regla los métodos privados solamente están disponibles en la clase donde se definen.

class ApiConnector
  def api_logger
    secret_method
  end

  private
    def secret_method
      puts "A secret message from the parent class"
    end
end

# Para definir métodos privados en las clases sólo hay que crear un área 'private'
# Normalmente se acostumbra colocar las regiones privadas después de lo público ...
# En Ruby puedes abrir la definición de las clases cuando quieras!! (ApiConnector)
api_instance.api_logger

# Un concepto importante en OOP es el "Polimorfismo", el cual ocurre cuando una
# clase que hereda de otra clase modifica el comportamiento heredado del padre ~
# Para invocar al método de la clase padre se utiliza 'super'

class PhoneConnector < ApiConnector
  def api_logger
    puts "Phone call API connection starting..."
    super
  end
end

phone = PhoneConnector.new("My Title", "Some content")
phone.api_logger


# En un tema aparte, para el manejo de archivos Ruby proporciona la clase 'File'
# Existen métodos de apertura: (r) lectura, (a) agregar, (w) escribir, (w+) lectura/escritura, etc.
# Se muestran dos formas de trabajar los archivos, mediante variable de bloque o sentencias normales ...
# Mediante el método 'split' se dividen los elementos de una cadena utilizando un separador ~

File.open("archivos/teams.txt" , 'w+')  { |f| f.write("Twins, Astros, Mets, Yankees") }

file_to_save = File.new("archivos/teams.txt" , 'a')
file_to_save.puts("A's, Diamondbacks, Mariners, Marlins")
file_to_save.close

teams = File.read("archivos/teams.txt")
p teams.split(',')

File.delete("archivos/teams.txt")

# El manejo de errores en Ruby es muy similar a lo manejado en Java
# Para poder hacerse cargo de una excepción es necesario construir un bloque 'rescue',
# la idea es recuperar se de los errores y hacer algo al respecto ...

def error_logger (e)
  File.open('archivos/error_log.txt', 'a') do |file|
    file.puts e
  end
end

begin
  puts nil + 10
rescue StandardError => e
  error_logger("Error: #{e} at #{Time.now}")
end

# El mejor lugar para encontrar gemas de Ruby (paquetes) es https://rubygems.org
# Antes de utilizar una gema es necesario instalarla; para el siguiente código se requiere:
# En el ejemplo se mostrará el acceso a una API - RESTful interfaces
#
#   gem install httparty

require 'rubygems'
require 'httparty'

class EdutechionalResty
  include HTTParty
  base_uri "http://edutechional-resty.herokuapp.com"

  def posts
    self.class.get('/posts.json')
  end
end

api = EdutechionalResty.new
puts api.posts

# PENDIENTE
# Ruby Gems ...
