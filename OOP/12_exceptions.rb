# Prévoir les cas où le code s'exécute de façon non attendue.
# Ex : si la note rentrée n'est pas convertible en entier, il faut arrêter le script. L'exécution du code nous donne une erreur TypeError, qui hérite d'Exception. Cette erreur est générée automatiquement par Ruby.
# On peut nous-mêmes générer une erreur, avec "raise" (cf l. 14)
# Raise peut prendre plusieurs paramètres, avec notamment le type d'exception (conseillé, pour plus tard capturer les erreurs de manière indépendante avec "rescue").
# Prendre l'habitude, quand on teste le type des variables, de renvoyer des erreurs. Permet de ne pas avoir un code qui continue de s'exécuter, et de pouvoir capturer les erreurs pour afficher des messages si problème.

module Notable
  MOYENNE = 10

  def notes
    @notes = [] if !@notes
    @notes
  end

  def ajouter_note(note)
    raise ArgumentError, "Impossible d'ajouter une note qui n'est pas un entier" if !note.respond_to? :to_i

    notes << note
  end

  def moyenne?
    moyenne >= MOYENNE
  end

  def moyenne
    somme = 0
    notes.each do |note|
      somme += note
    end
    somme / notes.length
  end
end

class Eleve
  attr_reader :notes, :nom

  include Notable

  def initialize(nom)
    @nom = nom
    @notes = []
  end

  def afficher_nom(nom)
    puts "Je suis #{nom}"
  end
end

class Delegue < Eleve
  def ajouter_note(note)
    super(note + 1)
  end
end

# On veut également noter les profs par l'académie. Problème : professeurs et élèves n'ont pas d'ancêtre en commun. On créé donc le module Notable.
class Professeur
  include Notable
end

jean = Eleve.new('Jean')
jean.ajouter_note(18)
jean.ajouter_note(14)
puts "Jean a #{jean.moyenne}"

louis = Delegue.new('Martin')
louis.ajouter_note(18)
louis.ajouter_note(14)
puts "Louis a #{louis.moyenne}"


prof = Professeur.new
# Quand on sait que notre code peut renvoyer des exception :
# On peut capturer les erreurs (les gérer soi-même plutôt qu'avoir le gros message d'erreur), avec begin et end autour du code qui peut potentiellement générer des erreurs. Différebts "rescue" permettront de préciser chaque type d'erreur qu'on veut capturer.
begin
# prof.ajouter_note([10, 12])
# prof.ajouter_note(10)
puts "Le professeur a #{prof.moyenne}"
puts "Parfait !" # S'il y a une erreur, ça ne sera pas affiché
rescue ArgumentError # (=le type d'erreur à capturer. "Exception" capturera toutes les erreurs, car toutes les erreurs héritent d'Exeption.)
  puts "Impossible d'ajouter une note"
rescue ZeroDivisionError
  puts "Le professeur n'a pas de note"
# ensure # Si on veut exécuter un code quoiqu'il arrive, erreur ou non
#   puts "Problème rencontré"
end



# AUTRE POSSIBILITE :
# prof = Professeur.new
# begin
# prof.ajouter_note([10, 12])
# puts "Le professeur a #{prof.moyenne}"
# puts "Parfait !"
# rescue ArgumentError => e # Renvoie l'erreur telle qu'elle est donnée.
#   puts e.to_s
# rescue ZeroDivisionError
#   puts "Le professeur n'a pas de note"
# end

# begin et rescue n'empêchent pas la suite d'exécution du code.
