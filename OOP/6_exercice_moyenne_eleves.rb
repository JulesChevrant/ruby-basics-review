class Eleve
  MOYENNE = 10 # On définit cette constante car la moyenne est toujours définie à 10
  attr_reader :notes, :nom # Pour accéder aux notes depuis l'extérieur

  def initialize(nom)
    @nom = nom
    @notes = [] # tableau qui contiendra les notes
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
      somme += note # On obtient la somme des différentes notes
    end
    somme / @notes.length
  end
end

eleve = Eleve.new("Jean")
eleve.ajouter_note(18)
eleve.ajouter_note(10)
eleve.ajouter_note(2)

puts eleve.notes.inspect # doit retourner [18, 10, 2]
puts "Moyenne ? #{eleve.moyenne?}" # true ou false
puts "Moyenne de #{eleve.nom} : #{eleve.moyenne}"
