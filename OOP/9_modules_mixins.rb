# Héritage horizontal : Greffer un certain nombre de méthodes à certaines classes qui n'ont pas de parents en commun.
# Un module peut être inclu dans une classe.

module Marche
  def marcher
    puts 'Je marche'
  end

  def courir
    puts 'Je cours'
  end
end

class Humain
  include Marche # va greffer toutes les méthodes d'instance qui sont dans le module Marche au niveau de la classe
end

class Chat
  include Marche
end

class Dauphin
end

Chat.new.marcher
Humain.new.courir
