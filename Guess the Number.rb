secret_number = rand(1..100)
tries = 0

puts "Welcome to the Guess the Number Game!"
puts "I'm thinking of a number between 1 and 100."

loop do
  print "Your guess: "
  guess = gets.chomp.to_i
  tries += 1

  if guess < secret_number
    puts "Higher!"
  elsif guess > secret_number
    puts "Lower!"
  else
    puts "Congratulations! You guessed the number in #{tries} tries."
    break
  end
end
