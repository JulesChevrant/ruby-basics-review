# Les modules dans Ruby permettent de créer des groupes de méthodes que l'on pourra ensuite inclure dans nos différentes classe (ex : englober nos classes). Cela permet de séparer des blocs de code qu'on pourrait avoir à répéter à plusieurs endroits.
# Un module ne peut pas être instancié, ni hérité.
# Permet de mieux s'organiser (ex le module "math" permet de regrouper toutes les fonctions mathématiques) et d'éviter la collision avec d'autres classes (namespacing).
# Peut cependant compliquer la lisibilité, pour comprendre quelles sont les méthodes d'une classe (il faut regarder les include puis les modules...)

require 'date'

module Cercle
  PI = 3.1415 # Constante

  def self.perimetre(rayon)
    2 * PI * rayon
  end
end

puts Cercle.perimetre(10)

# On peut accéder depuis l'extérieur aux constantes définies dans un module.
# Il faut ajouter < NomModule:: > avant le nom de la méthode.
puts Cercle::PI

# Pour inclure des modules tiers (ex Date), il faut utiliser require tout en haut : require 'date'
puts Date.today.monday?

# On peut séparer notre code en fichiers pour s'y retrouver, chacun ayant un rôle particulier. Pour inclure des fichiers:
# require_relative : permet d'inclure un fichier relatif au fichier courant.
