def read(name)
  file = File.open(name)
  page = file.readlines.map(&:chomp)
  file.close
  puts page
end

while true
  students = []
  File.open('fio.txt').each_line do |line|
    students.push(line.chomp)
  end

  read('fio.txt')
  puts 'Please,enter student(s) age'
  age = gets.chomp

  page_result = File.open('result.txt').readlines.map(&:chomp).select{|item| item.include?(age)}
  find = File.open('fio.txt').readlines.map(&:chomp).select{|item| item.include?(age)}
  if find.any?
    if page_result.none?
      puts find
      File.open('result.txt','a'){ |f| find.each { |element| f.puts(element) } }
    else puts 'Save students'
    end
  else puts 'No student'
  end 

  result = []
  File.open('result.txt').each_line do |line|
    result.push(line.chomp)
  end 

  if result.size == students.size 
  else puts "press enter to continue or press 1 to exit"
    exit = gets.to_i
    if exit == 1
      read('result.txt')
      break
    end
  end
end 

     