text = "Il ne faut avoir aucun regret pour le passé, aucun remords pour le présent, et une confiance inébranlable pour l'avenir. Il ne faut pas chercher à rajouter des années à sa vie, mais plutôt essayer de rajouter de la vie à ses années."

# Créer un hash pour stocker les mots et le nombre d'occurences
# Séparer le texte et obtenir un tableau de tous les mots (split)
# Itérer sur le tableau
# Remplir le hash
# Afficher les informations
# Organiser les mots, pour sortir les mots les plus fréquents
# A noter : .tr permet de remplacer les caractères choisis (premier paramètres) par un espace (second paramètre).

frequencies = Hash.new(0)
words = text.tr('.,":', '').downcase.split(" ")
# puts words.inspect
words.each do |word|
  frequencies[word] += 1
end

puts frequencies
puts "-------------------------"

frequencies = frequencies.sort_by { |word, count| count }
puts frequencies.reverse!.inspect

puts "-------------------------"

frequencies.each do |word|
  puts "Le mot '#{word[0]}' apparait #{word[1]} fois."
end

puts "-------------------------"
puts "Le mot qui apparait le plus souvent est le mot : '#{frequencies.first[0]}'"


#       OU
# frequencies = {}
# words = text.downcase.split(" ")
# # puts words.inspect

# words.each do |word|
#   if frequencies[word]
#     frequencies[word] += 1
#   else
#     frequencies[word] = 1
#   end
# end
