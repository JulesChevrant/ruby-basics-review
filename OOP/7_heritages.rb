# L'héritage permet de créer un nouveau type d'élève, sans avoir à réécrire toutes les méthodes relatives à la classe Eleve. La classe Delegue va hériter de la classe parente Eleve, car ces méthodes doivent aussi s'appliquer dans le cas d'un délégué.

class Eleve
  MOYENNE = 10
  attr_reader :notes, :nom

  def initialize(nom)
    @nom = nom
    @notes = []
  end

  def ajouter_note(note)
    @notes << note.to_i
  end

  def moyenne?
    moyenne >= MOYENNE
  end

  def moyenne
    somme = 0
    @notes.each do |note|
      somme += note
    end
    somme / @notes.length
  end
end

class Delegue < Eleve

  # On peut ajouter des méthodes supplémentaires propres au délégué.
  # On peut aussi écraser des méthodes de la classe parente.
  # Si on veut appeler la méthode parente pour y ajouter qqch, sans l'écraser complètement, on peut utiliser le M-C "super". Si on ne précise aucun argument, la méthode parente sera appelée avec les mêmes arguments.

  def moyenne
    moyenne = super
    moyenne + 1 # moyenne est à la base une méthode, mais ici on appelle la variable locale définie au-dessus. Notre programme sait qu'on ne veut pas appeler la méthode car on a défini cette variable locale. moyenne() permettrait d'appeler la méthode.
  end

  # On va redéfinir cette méthode uniquement pour le délégué.
  # super peut prendre des paramètres.
  # ça appelle la méthode parente, en lui passant un paramètre.
  def ajouter_note(note)
    super(note + 1)
  end

end

d = Delegue.new("Théo")
d.ajouter_note(18)
d.ajouter_note(5)
d.ajouter_note(9)

puts "#{d.nom} a ces notes : #{d.notes}"
puts "#{d.nom} a une moyenne de #{d.moyenne}"

# Obtenir la classe qui correspond à l'instance :
puts d.class

# Obtenir la classe qui est au dessus au dessus :
puts d.class.superclass

# RÉSUMÉ :
# On peut hériter une classe pour automatiquement récupérer ses méthodes.
# Puis on peut soit :
# - Créer de nouvelles méthodes par dessus
# - Ecraser une méthode pour changer son comportement
# - Ecraser une méthode pour appeler la méthode parente en modifiant un peu son comportement.

# La classe d'un entier est 'Fixnum'. Cette dernière hérite de 'Integer', qui hérite de 'Numeric'.
# Les objets de base de Ruby utilisent ce système d'héritage. Un entier fixnum dispose donc des méthodes de la classe Fixnum et des méthodes parentes.
