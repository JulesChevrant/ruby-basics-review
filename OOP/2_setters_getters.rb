# Les variables d'instance ne sont pas accessibles depuis l'extérieur. Il faut utiliser les setters/getters pour les rendre accessibles.
# Ex : Je ne donne pas l'âge, je veux pouvoir permettre de définir l'âge plus tard.
# Setter : permet de définir une variable
# Getter : permet de l'obtenir
# Manière manuelle de créer les paramètres :

class Eleve
  def initialize(nom)
    @nom = nom
  end

  def age=(age)
    @age = age
  end
  # Ainsi on peut définir l'âge à la volée

  def age
    @age
  end

end

eleve1 = Eleve.new("Jean")
eleve1.age = 10
puts eleve1.age

puts "-----------"
# ça évite d'avoir à créer des méthodes âge, taille, etc...
# Créer des variables d'instance de manière automatique : avec attr_writer, accessor, reader. Ce sont des méthodes de classe qui permettent de créer les getters/setters.

class Student
  attr_reader :name
  # Créé un getter (si on créé des méthodes "def name", "def age", ou si ces infos sont définies par l'initializer...)
  # attr_writer permet juste de créer le setter
  attr_accessor :age, :height
  # Créé dynamiquement à la fois un getter et un setter

  def initialize(name)
    @name = name
  end
end

student1 = Student.new('Jack')
student1.age = 18
student1.height = 180
puts "#{student1.name} is #{student1.age} years old and #{student1.height} cm tall."
