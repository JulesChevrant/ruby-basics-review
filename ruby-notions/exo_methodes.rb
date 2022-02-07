# EX 1 : Conversion

def convert_to_min(seconds)
  seconds = seconds.to_i
    seconds/60
end
puts convert_to_min(400)

puts '-----------'

# EX 2 : Saluer

def say_hi(name)
  "Hi #{name}"
end
# puts say_hi("Tom")


# EX 3 : Réorganiser une liste par ordre croissant ou décroissant selon une condition (1er paramètre)

def reorganiser_list(croissant, *noms)
  noms_propres = []
  noms.each do |nom|
    noms_propres << nom.to_s
  end
  noms_propres.sort!
  noms_propres.reverse! if !croissant
  return noms_propres
end

# OU utiliser la méthode .collect pour raccourcir
# def reorganiser_list(croissant, *noms)
#   noms_propres = noms.collect { |nom| nom.to_s }
#   noms_propres.sort!
#   noms_propres.reverse! unless croissant
#   noms_propres
# end


# Organiser de a -> z
puts reorganiser_list(true, 'Marc', 'Jean', 'Marie', 'Manon', 'Antoine', :Rick, 'Jonathan').inspect
puts '-----------'
# Organiser de z -> a
puts reorganiser_list(false, 'Marc', 'Jean', 'Marie', 'Manon', 'Antoine', :Rick, 'Jonathan')
