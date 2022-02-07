#Vérifier qu'on peut appliquer une certaine méthode à la valeur passée en paramètre, avant de pouvoir lui appliquer cette méthode.

def majuscule(mot)
  if mot.respond_to?(:upcase)
    mot.upcase
  else
    puts "Error"
  end
end

=begin   OU vérifier si la conversion est possible

def majuscule(mot)
  if mot.respond_to?(:to_s)
    mot.to_s.upcase
  else
    puts "Error"
  end
end

=end

puts majuscule('Salut')
puts majuscule(3)

puts "----------------"

def triple(chiffre)
  if chiffre.respond_to?(:to_f)
    chiffre.to_f * 3
  else
    puts "Erreur"
  end
end

puts triple("Salut")
puts triple('1.82')
puts triple(2)
puts triple(["a", "b", "c"])
