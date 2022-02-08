# Les classes peuvent aussi avoir des méthodes. On les définit avec "self.".
# On peut avoir des variables de classe avec @@, qu'on définit au niveau de la classe. Elles sont communes à toutes les instances.

class Eleve

  @@majorite = 18

  def self.bonjour(nom)
    puts "Bonjour #{nom}"
  end

  def initialize(nom, age)
    @nom = nom
    @age = age
  end

  def bonjour
    self.class.bonjour(@nom)
  end

  def a_majorite?
    @age >= @@majorite
  end
  # @age est propre à chaque élève, @@majorite est propre à la classe.
end

# Pour utiliser cette méthode : on peut l'appeler directement sur la classe.
Eleve.bonjour("Jean")

# Instance
eleve1 = Eleve.new("Bob", 18)
puts eleve1.a_majorite?

# On peut utiliser une méthode de classe depuis une instance.
# cf l.18 : On a créé la méthode bonjour et on a envie d'utiliser la méthode de classe self.bonjour.
# self fait référence à l'objet en cours. ".class" permet d'obtenir la classe qui correspond à self. On passe en paramètre la variable d'instance.
puts eleve1.bonjour
