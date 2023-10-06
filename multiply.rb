def multiply_numbers(a, b)
  a * b
end

# Ask the user for input
print "Enter Number 1: "
num1 = gets.chomp.to_i

print "Enter Number 2: "
num2 = gets.chomp.to_i

# Calculate the product
product = multiply_numbers(num1, num2)

# Display the result
puts "The product of #{num1} and #{num2} is #{product}"
