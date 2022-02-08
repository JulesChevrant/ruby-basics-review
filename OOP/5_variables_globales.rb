# Lorsqu'on écrit une variable n'importe où dans notre code, elle est automatiquement globale.
# Si on souhaite interagir avec une variable globale depuis une classe ou une méthode, il faut ajouter le symbole $
# Si je créé une variable dans une méthode, elle sera locale. Dès la fin d'exécution de cette méthode, la variable aura disparu.
# Pour avoir une variable globale, il faut la précéder de $, elle sera alors accessible partout (rarement utilisé).

$variable1 = "a"

class Eleve

  @@majorite = 18

  def initialize(nom, age)
    @nom = nom
    @age = age
  end

  def self.bonjour
    puts "Bonjour #{$variable1}"
  end

  def a_majorite?
    @age >= @@majorite
  end
end

Eleve.bonjour

eleve1 = Eleve.new("Bob", 18)
puts eleve1.a_majorite?

# CONSTANTES
# Possibilité de créer des constantes = des variables qui ne pourront jamais être modifiées dans notre code.
# La constante dépend du contexte : si on la définit au niveau d'une classe, elle est donc propre à cette classe.
# On les écrit en majuscules. Ex : MAJORITE = 18
# Partout où je veux accéder à cette constante, il suffit de l'appeler.
