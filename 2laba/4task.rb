def method_name()
  pokemons = []
  puts "How many pokemon will we add?"
  a = gets
  a.to_i.times do
    puts "Name:"
    name = gets.chomp
    puts "Colour:"
    colour= gets.chomp
    pokemons << {name:name, colour:colour}
  end
  puts pokemons
end
method_name()