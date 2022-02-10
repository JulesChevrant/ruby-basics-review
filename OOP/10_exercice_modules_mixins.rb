module Notable
  MOYENNE = 10

  def notes
    @notes = [] if !@notes
    @notes
  end

  def ajouter_note(note)
    raise "Impossible d'ajouter une note qui n'est pas un chiffre" if !note.respond_to? :to_i

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
  MOYENNE = 10
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

  attr_reader :nom

  include Notable

  def initialize(nom)
    @nom = nom
  end
end

jean = Eleve.new('Jean')
jean.ajouter_note(18)
jean.ajouter_note(14)
puts "Jean a #{jean.moyenne}"

louis = Delegue.new('Martin')
louis.ajouter_note(18)
louis.ajouter_note(14)
puts "Louis a #{louis.moyenne}"

prof = Professeur.new("Random")
prof.ajouter_note(18)
prof.ajouter_note(14)
puts "Le professeur, M. #{prof.nom}, a #{prof.moyenne}"
