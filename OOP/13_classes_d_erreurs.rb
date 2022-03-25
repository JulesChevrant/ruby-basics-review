#  On peut créer des classes d'erreurs.

module Notable
  MOYENNE = 10

  class Error < RuntimeError
  end

  class MoyenneError < Error
    def initialize(msg = "Impossible de calculer une moyenne sans notes") # Notre message d'erreur par défaut
      super
    end
  end

  class AjoutNoteError < Error
  end

  def notes
    @notes = [] if !@notes
    @notes
  end

  def ajouter_note(note)
    raise AjoutNoteError if !note.respond_to? :to_i
    notes << note
  end

  def moyenne?
    moyenne >= MOYENNE
  end

  def moyenne
    somme = 0
    raise MoyenneError if notes.length == 0 # Si note est vide on renverra une erreur définie par notre classe
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

class Professeur
  include Notable
end

prof = Professeur.new
begin
# prof.ajouter_note([10, 12])
# prof.ajouter_note(10)
puts "Le professeur a #{prof.moyenne}"
puts "Parfait !"
rescue Notable::Error => e
  puts e.to_s
end

# Ou, moins conseillé :
# prof = Professeur.new
# begin
# # prof.ajouter_note([10, 12])
# # prof.ajouter_note(10)
# puts "Le professeur a #{prof.moyenne}"
# puts "Parfait !"
# rescue Notable::AjoutNoteError => e
#   puts e.to_s
# rescue Notable::MoyenneError => e
#   puts e.to_s
# end
