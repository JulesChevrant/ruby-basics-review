# On a la possibilité de convertir une méthode en bloc en utilisant un système de symbole. Ex : on veut convertir ce tableau mixé, pour n'avoir que des entiers.
a = ["1", "4", 5]

# 1ère méthode classique :
puts a.map { |n| n.to_i }.inspect

puts "-------"
# 2ème méthode pour réduire le code (avec un symbole qui va être la méthode à appeler sur chaque élément qui sera passé au niveau du bloc):
puts a.map(&:to_i)
