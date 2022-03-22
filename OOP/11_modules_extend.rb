# L'extend transfert les méthodes d'instance en méthodes de classe.
# Toutes les méthodes d'instance du module A seront disponibles au niveau des méthodes de classe C.
# On retrouve plus souvent include que extend dans ruby.

module A

  # méthode d'instance
  def demo
    puts 'demo'
  end

end

class C

  extend A # revient à faire une méthode def seld.demo identique à la première.

end

c = C.new # (on peut ajouter à posteriori à cette nouvelle instance les méthodes d'instance de A en utilisant extend(A))
# Quand on appelle un extend sur une instance, ça rajoute les méthodes au niveau de cette instance uniquement.
c.extend(A)
c.demo
