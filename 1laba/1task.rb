def checkData
  puts "Hello student.Please,enter your data!"
  puts "Name:" 
  name = gets.chomp()
  puts "Lastname:" 
  lastname = gets.chomp()
  puts "Age:" 
  age= gets.chomp()
  if age.to_i < 18 and age.to_i > 0
    puts "Hi,#{name} #{lastname}.Your age is less than 18 years,but start learning to program never early "
  elsif age.to_i >= 18
    puts "Hi,#{name} #{lastname}.It's time to start!"
  else puts "Error,incorrect data" 
  end
end
checkData