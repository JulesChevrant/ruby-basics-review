# Bloc = morceau de code qui permet d'exécuter un morceau de code dans un cas concret ("fonction anonyme" dans d'autres langages). Ils ne sont pas des objets, ils ne peuvent être sauvegardés dans des variables.

tableau = [1, 2, 6]
tableau2 = tableau.map { |item| item * 2}
puts tableau2.inspect

puts "----------"

# On veut utiliser des blocs dans nos propres méthodes. Pour que la fonction prenne en paramètre un bloc, il faut utiliser le mot-clé YIELD.
# ça voudra dire : cette méthode attend un bloc (obligatoirement) et je veux que tu exécutes le code qui est à l'intérieur du bloc à cet endroit là.
# Si on met un yield dans une fonction, automatiquement elle attendra un paramètre qui sera un bloc.

def demo
  puts 'Bonjour'
  yield
  puts 'Au revoir'
end

demo { puts 'Comment ça va ?'}

puts "----------"

# On peut aussi donner un paramètre à notre bloc (via le yield) :
def demo_bis
  puts 'Bonjour'
  yield('Louis')
  yield('Jean')
  puts 'Au revoir'
end

demo_bis { |nom| puts "Comment vas-tu, #{nom} ?" }

puts "----------"

# On souhaite lister les élèves ayant la moyenne.
# La fonction prendra en paramètre la liste des élèves (car dans la méthode on est isolé de l'extérieur).

eleves = [
  { note: 18, nom: 'Martin' },
  { note: 8, nom: 'Jean' },
  { note: 12, nom: 'Manon' },
  { note: 15, nom: 'Louise' }
]

def alamoyenne(eleves)
  eleves.each do |eleve|
    if eleve[:note] >= 10
      yield(eleve)
    end
  end
end

alamoyenne(eleves) do |eleve|
  puts "#{eleve[:nom]} a la moyenne"
end

puts "----------"

# Problème : les blocs ne sont pas des objets et ne peuvent être sauvegardés pour être réutilisés (+ on ne peut passer qu'un seul bloc à une fonction).
# Les procs sont comme des blocs qu'on peut sauvegarder dans une variable, pour les réutiliser à plusieurs endroits et donc éviter de se répéter.
# Les procs ne sont pas des blocs, ça peut créer des erreurs car une fonction peut attendre un bloc (ex "wrong number of arguments"). Pour convertir un proc en bloc : & avant le nom du proc passé en paramètre. (Le & permet de passer d'un bloc à un proc et d'un proc à un bloc)
# Ex : on veut calculer le carré des valeurs contenus dans deux tableaux.

=begin
a = [1, 2, 3, 6]
b = [1, 7, 9]

carre = Proc.new { |n| n**2 }

a.map!(&carre)
b.map!(&carre)
puts a.inspect
puts b.inspect
=end

students = [
  { note: 18, nom: 'Bob' },
  { note: 8, nom: 'Ted' },
  { note: 12, nom: 'Marie' },
  { note: 15, nom: 'Emma' }
]

def moyenne_ou_plus(students)
  students.each do |student|
    if student[:note] >= 10
      yield(student)
    end
  end
end

qui_a_moyenne = Proc.new { |student| puts "#{student[:nom]} a la moyenne" }

moyenne_ou_plus(students, &qui_a_moyenne)

puts "----------"
# Les procs sont des nouveaux objets dans Ruby, on pourra faire des opérations dessus.
# On peut appeler à n'importe quel moment notre proc en faisant :
qui_a_moyenne.call({note: 18, nom: 'Bob'})

puts "----------"

# Autre avantage par rapport aux blocs : on peut passer plusieurs procs à une méthode.

studs = [
  { note: 18, nom: 'A' },
  { note: 8, nom: 'B' },
  { note: 12, nom: 'C' },
  { note: 15, nom: 'D' }
]

def tri_moyenne(studs, moyenneproc, pasmoyenneproc)
  puts moyenneproc
  puts pasmoyenneproc
  studs.each do |stud|
    if stud[:note] >= 10
      moyenneproc.call(stud)
    else
      pasmoyenneproc.call(stud)
    end
  end
end

a_moyenne = Proc.new { |stud| puts "#{stud[:nom]} a la moyenne" }
pas_moyenne = Proc.new { |stud| puts "#{stud[:nom]} n'a pas la moyenne" }

tri_moyenne(studs, a_moyenne, pas_moyenne)

puts "----------"
# Cf fichier lambda.rb
