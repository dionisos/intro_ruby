
# Comprehensive Ruby Programming
# Jordan Hudgens, Packt Publishing

name = "Jordan"
address = ["123", "Anystreet", "Anytown", "TX"]
puts "Programación Ruby"
p "A diferencia de puts retorna un valor ..."
# 'puts' imprime los elementos individuales del arreglo, 'p' lo hace en una sola línea :P

puts "Please enter your password: "
password = gets.chomp

# El alcance de las variables locales se limita al área en que fueron declaradas (método, loop)
# Por otro lado se pueden definir variables globales ($) las cuales están disponibles en toda la aplicación.
# En Ruby no existen las constantes aunque por convención su nombre se usa todo en mayúsculas.

$variable_global = "Yankees"
CONSTANTE = "Sólo convención en el identificador ..."

class MyClass
    @@variable_clase = ["UANL", "Tigers"]
    @variable_instancia = "DropCode!"
end

# Para que funcione la interpolación de cadenas deben usarse comillas y no apóstrofes ('')
# En realidad dentro de las llaves de interpolación puede ir cualquier script Ruby aunque no es muy recomendable
# En las cadenas dado que son objetos es posible aplicarles manipulaciones mediante métodos precargados ...
# Hay métodos que terminan con un bang (!) lo cual significa que la variable original es modificada :P

cadena_interpolar = "Tiger"
variable_texto = "Interpolacion de cadenas #{cadena_interpolar}"
"Astros".upcase.reverse.swapcase

cadena = "The quick brown fox jumped over the quick dog"
puts cadena.gsub "quick", "slow"
variable_texto.gsub! "Tiger", "Bear"
p cadena.split
puts "backwards am I".split.reverse.join(' ')

# Ruby sabe de antemano que un método retorna la última línea de código, para retornar prematuramente se usa 'return'
# La diferencia entre los métodos de clase y los de instancia es que para los segundos se requiere un objeto.
# En Ruby se utiliza la palabra reservada 'self' para hacer declarar los métodos de clase.

def baseball_team_list
    argumento = 10
    return ["A's", "Angels", "Astros"] if argumento == 10
    ["Yankees", "Mets"]
end

class Invoice
    def self.print_out
        "Metodo de clase (self)"
    end

    def convert_to_pdf
        "Metodo de instancia"
    end
end

p baseball_team_list
Invoice.print_out
Invoice.new.convert_to_pdf

# Se puede decir que un "Ruby Proc" (Closure) es un método que puede ser almacenado en una variable.
# Hay dos formas de invocarlos, mediante notación de corchetes o mediante la llamada 'call'
# Los 'lambdas' se definen en una forma muy similar (aunque permite la notación lambda y ->)

full_name = Proc.new { |first, last| first + " " + last }
multiple_name = Proc.new do |first|
    first * 3
end

p full_name["Jordan", "Hudgens"]
p multiple_name.call("dionisos")

#full_name = lambda { |first, last| first + " " + last }
full_name = -> (first, last) { first + " " + last }
p full_name["Carlos", "Soria"]
p full_name.call("Gonzalo", "Villegas")

# Entre las principales diferencias de las lambdas y los closures "Ruby Proc" se tiene que los lambdas
# cuentan sus argumentos y los procs no lo hacen ... algo a considerar en la prevensión de errores.
# La segunda diferencia importante es que cuando un Proc encuentra un 'return' termina la ejecución del bloque
# que lo circunda, mientras que un lambda sí continua su ejecución!

ejemplo_lambda = lambda { |first, last| first + " " + last}
# p ejemplo_lambda.call("Jonathan", "Davis", "Niemand") # Genera un error por tener más argumentos :P

def my_method
    #bloque_codigo = Proc.new { return } # Termina la ejecución del método
    bloque_codigo = lambda { return } # Continua la ejecución del metodo
    bloque_codigo.call
    p "Texto dentro del metodo!"
end

my_method


def full_name(first_name, last_name)
  first_name + " " + last_name
end

puts full_name("Carlos", "Soria")

def full_name_alterno first_name, last_name
  first_name + " " + last_name
end

# El estilo de programación sin parentesis es preferido por los programadores Ruby!
puts full_name_alterno "Carlos", "Soria"

# Podemos nombrar los argumentos de un método para hacer el código más descriptivo.
# En realidad no hay diferencia, sólo beneficia en evitar errores :P
# Cabe mencionar que no implica que puedan pasarse menos argumentos a los métodos ¬¬

def print_address city:, state:, zip:
  puts city + " " + state + " " + zip
end

print_address city: "Scottsdale", state: "AZ", zip: "85251"

# Es posible desde la definición de un método indicar argumentos por default,
# con ello al menos que se requiera un valor diferente puede ignorarse de la lista de argumentos.

def stream_movie title:, lang: lang = 'English'
  puts title
  puts lang
end

stream_movie title: 'The Fountainhead'
stream_movie title: 'The Fountainhead', lang: 'Spanish'

# TRADITIONAL SPLAT ARGUMENTS
# Para indicar que un método puede recibir uno o más argumentos a petición se debe
# utilizar un asterisco delante del nombre del parámetro.
# Internamente el argumento puede ser tratado como un arreglo dentro del método.

def roster *players
  puts players
end

roster 'Altuve', 'Gattis', 'Springer'

# KEYWORD-BASED SPLAT ARGUMENTS
# Para indicar que se está recibiendo un conjunto de datos identificados por llave se usa doble asterisco.
# En este tipo de casos podemos separar cada dupla recibida en llave y valor e utilizarles en un loop ~
def rosterkb **players_with_positions
  players_with_positions.each do |player, position|
    puts "Player: #{player}" + ", Position: #{position}"
  end
end

data = {
  "Altuve": "2nd Base",
  "Alex Bregman": "3rd Base",
  "Evan Gattis": "Catcher",
  "George Springer": "OF"
}

rosterkb data

# OPTIONAL ARGUMENTS
# Para el manejo de argumentos opcionales se utiliza un hash en la definición del método
# No obstante hay que tener mucho cuidado ya que si se trata de utilizar un argumento no existente,
# ningún error es generado, sencillamente no ocurre nada!!

def invoice options={}
  puts options[:company]
  puts options[:total]
  puts options[:something_else]
end

invoice company: "Google", total: 123, state: "AZ"
