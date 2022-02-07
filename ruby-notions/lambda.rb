# Lambda : c'est un proc particulier. 2 différences :
# 1 - Un lambda prend un nombre de paramètres particulier (il vérifie ce  nombre). Le nb de paramètres doit être identique pour un lambda (pas le cas pour Proc.new).

# 2 - Dans le cas du Proc, lorsqu'on appelle Proc.new via le call, le return est considéré comme un return classique : le a.call fait un return de "Salut". C'est ce "Salut" qui sera retourné.
#   --> le return contenu dans un Proc prend le contrôle au dessus de la fonction; mettre un return dans un proc bloquera l'exécution de la fonction et ça fera un return au sein de la fonction.

def a_proc
  a = Proc.new { return "Salut" }
  a.call
  return "Au revoir"
end

puts a_proc

puts "-----"
# Dans un lambda, le return renvoie au sein du bloc, et non au niveau de la fonction (le b.call donne "salut" et c'est le second return dans la fonction qui sera pris en compte).
#   --> le return renvoie au niveau du bloc, ne bloque pas l'exécution de la fonction.

def a_lambda
  b = lambda { return "Salut" }
  b.call
  return "Au revoir"
end

puts a_lambda

# Syntaxe :
# moyenne = lambda { |eleve| puts "#{eleve[:nom]} a la moyenne" }
# Syntaxe plus récente possible :
# moyenne = ->(eleve){ puts "#{eleve[:nom]} a la moyenne" }
