
# Comprehensive Ruby Programming
# Jordan Hudgens, Packt Publishing

contador = 0
while contador < 10
  contador += 1
end

# Mediante un loop 'each' es posible iterar sobre los elementos de una colección
# Es posible utlizar la notación de bloque o una más sencilla si es una sola sentencia ...
# En Ruby es más utilizado 'each' que 'for' dada su versatilidad con las colecciones!

arreglo = [23, 2343, 454, 123, 345345, 1232]
arreglo.each do |elemento|
  p elemento
end

# arreglo.each{ |elemento| p elemento }
# puts new_max arreglo
def new_max array_of_elements
  max_value = 0
  array_of_elements.each do |i|
    if i > max_value
      max_value = i
    end
  end
  max_value
end

for contador in 0...3
  # p contador
end

teams = {
  "Houston Astros" => {
    "first base" => "AJ Reed",
    "second base" => "Jose Altuve",
    "shortstop" => "Carlos Correa"
  },
  "Texas Rangers" => {
    "first base" => "Prince Fielder",
    "second base" => "R. Odor",
    "shortstop" => "Elvis Andrus"
  }
}

teams.each do |team, players|
  puts team
  players.each do |position, player|
    p "#{player} starts at #{position}"
  end
end

# El método 'select' es bastante útil ya que itera sobre una colección y
# extrae sin más sólo los elementos que cumplen cierto criterio ...
# Con 'map' podemos crear nuevas colecciones a partir otras utilizando su información

(1...10).to_a.select  { |x| x.even?}
arr = %w(The quick brown fox jumped over the lazy dog)
p arr.select { |x| x.length> 5}

arr = (1..100)
seleccion = arr.select do |e|
  e % 3 == 0 && e % 5 == 0
end

p seleccion

p ["1", "23.0", "0", "4"].map {|x| x.to_i}
p Hash[ %w(A dynamic open source programming language).map { |x| [x, x.length] } ]


numeros = [1, 4, 1, 3, 2, 1, 4, 5, 4, 4, 5, 4]

def histogram nums
  nums.inject(Hash.new(0)) do |hash, e|
    hash[e] += 1
    hash
  end
end

p histogram numeros

# Los arreglos pueden crearse de dos formas. En la segunda hay que tener cuidado,
# ya que todos los elementos que no se definan estarán presentes como 'nil' ...
# La primera es como ya se ha mostrado anteriormente mediante una lista en corchetes
# Como con cualquier colección podemos iterar sobre sus elementos con 'each'

primer_arreglo = [12, 3, 454, 234, 234]
segundo_arreglo = Array.new

segundo_arreglo[0] = 543
segundo_arreglo[10] = -17

p segundo_arreglo

primer_arreglo.each do | elemento |

end

# En Ruby un arreglo puede tener elementos de diferentes tipos!
# Para borrar todos los elementos de un arreglo que coincidan a una búsqueda se usa delete()
# Si se desea borrar una posición en específico se emplea el método delete_at()
# Importante recordar que los índices comienzan en cero ...

arreglo_ruby = ["asdf", 3, 4, 12, "asdf", "b", true, 34, 2, 4, 4, 4]
arreglo_ruby.delete(4)
arreglo_ruby.delete_at(3)

p arreglo_ruby

# Una forma alternativa de gestionar elementos en un arreglo es mediante push/pop,
# con estos métodos se agregan elementos o se quitan, en ambos casos siempre del final :)

teams = ["astros", "yankees", "rangers", "mets", "cardinals"]
teams.push("red sox", "blue jays", "venados")
teams.pop

p teams

# Un Hash está basado en una colección de duplas llave/valor
# La ventaja sobre los arreglos es que para acceder a un elemento basta con su "llave" no es necesario saber su posición
# Existen tres formas para declarar un Hash, en particular me parece mejor la primera ...

positions = { first_base: "Chris Carter", second_base: "Jose Altuve", short_stop: "Carlos Correa" }
positions = { "first_base" => "Chris Carter", "second_base" => "Jose Altuve",  "short_stop" => "Carlos Correa" }
positions = { :first_base => "Chris Carter", :second_base => "Jose Altuve", :short_stop => "Carlos Correa" }

p positions[:second_base]
positions.delete(:second_base)
p positions

# Para iterar sobre las llaves/valores de un Hash se pueden utilizar los métodos each_key/each_value
# Si se desea agregar elementos solamente hay que utilizar una nueva llave
# Con el método 'invert' podemos intercambiar el orden llave/valor y guardar los cambios en otro Hash
# Es posible juntar dos estructuras Hash mediante el método 'merge'
# Mediante los métodos keys/values se obtiene un arreglo con todas las llaves/valores del Hash

people = { jordan: 32, tiffany: 27, kristine: 10, heather: 29 }
people[:leann] = 42

people.each_key do |key|

end

p people.invert
p people.merge(people.invert)
p people.keys
