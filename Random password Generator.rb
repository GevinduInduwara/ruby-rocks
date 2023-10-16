def generate_password(length)
  characters = ('a'..'z').to_a + ('A'..'Z').to_a + (0..9).to_a
  password = (1..length).map { characters.sample }.join
end

puts "Enter the password length:"
length = gets.chomp.to_i

puts "Your password is: #{generate_password(length)}"
