adeviner = 4
a = nil
for num in 1..3
  next if a == adeviner
  puts "Votre chiffre ?"
  a = gets.chomp.to_i
    if a > adeviner
      puts "Trop grand"
    elsif a < adeviner
      puts "Trop petit"
    else
      puts "Bravo!"
  end
end
