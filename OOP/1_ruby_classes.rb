# Classes : permettent de définir des objets plus élaborés.
# La classe d'une chaîne de caractères = string, d'un entier = integer, etc.
# Qd on créé une chaîne de caractères, on créé une nouvelle instance de cette classe.

class Eleve
  # On groupe dans la classe toutes les méthodes relatives à une instance de cette classe : méthodes d'instances.

  def initialize(nom, age)
  # Constructeur : s'exécute quand on créé une nvlle instance. Cette méthode peut prendre des paramètres, qui seront utilisés lors de la construction d'une nouvelle instance.
  # Les propriétés de nos instances sont les "variables d'instance", symbolisées par un @ (propres à chaque instance). Elles ne sont pas accessibles depuis l'extérieur.
  # On sauvegarde le nom de la variable pr pouvoir l'utiliser dans d'autres méthodes.
    @nom = nom
    @age = age
  end

  def bonjour
    puts "Bonjour, je m'appelle #{@nom}, j'ai #{@age} ans"
    if est_majeur?
      "Je suis majeur"
    else
      "Je ne suis pas majeur"
    end
  end
  #On peut appeler une méthode depuis une autre.

  def est_majeur?
    @age >= 18
  end
end

# Créer une nouvelle instance de la classe / Instancier la classe :
eleve1 = Eleve.new("Jean", 18)
# puts eleve1.inspect => #<Eleve:0x000055ab51b83678> = un ID unique.
eleve2 = Eleve.new("Martin", 17)
# Appliquer une méthode à une instance :
puts eleve1.bonjour
puts eleve1.est_majeur?

puts eleve2.bonjour
puts eleve2.est_majeur?
