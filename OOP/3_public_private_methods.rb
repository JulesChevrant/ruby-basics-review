class Eleve
  def initialize(nom)
    @nom = nom
  end

  def demo_public
    demo
  end
  # Cette méthode étant à l'intérieur de l'objet, elle peut faire appel à des méthodes privées.

  private
  # Les méthodes privées ne pourront pas être appelées par une instance.
  # On met en privé les méthodes qui n'ont pas d'intérêt à être accessibles depuis l'extérieur de la classe.
  # Les classes ont souvent bcp de méthodes, en mettre certaines en privé permet de mieux s'y retrouver. On peut rapidement savoir quelles méthodes on peut utiliser sur nos instances et celles qu'on ne peut pas utiliser.

  def demo
    puts "Demo"
  end

end

eleve1 = Eleve.new("Bob")
eleve1.demo_public
