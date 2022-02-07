adeviner = 4
# a = nil
loop do
  puts "Votre chiffre ?"
  a = gets.chomp.to_i
  if a > adeviner
    puts "Trop grand"
  elsif a < adeviner
    puts "Trop petit"
  else
    puts "Bravo!"
    break
  end
end
