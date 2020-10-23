class CashMachine
    
  def initialize
    @start = 100
  end 

  def deposit
    puts 'Deposit amount:'
    deposit = gets.to_i
    if deposit > 0 
      @start += deposit
      File.open('balance.txt','w'){|f| f.write @start}
      else puts 'Deposit must be greater than 0.!Enter a deposit greater than 0!'
    end 
  end
  
  def withdraw
    withdraw= gets.to_i
    if (withdraw > 0 && withdraw <= @start) 
      @start -= withdraw
      File.open('balance.txt','w'){|f| f.write @start}
    else puts 'Enter withdrawal amount  grater than 0 and equal to or less than balance !'
    end
  end

  def bank
  while true
    if File.file?('balance.txt') && !File.zero?('balance.txt')
      file = File.open('balance.txt')
      start = file.read.to_i
      file.close
      else puts 'File empty'
        start = 100.to_i
    end

    puts "Select operation action:"
    puts 'D (deposit)'
    puts 'W (withdraw)'   
    puts 'B (balance)'
    puts 'Q (quit)'
    puts " "

    operation = gets.chomp.upcase!
    case  operation
    when 'D' 
      deposit
    when 'W'
      withdraw
    when 'B'
      puts "Your balance: #{start}"
    when 'Q'
      break
    else
      puts 'Enter any of the above letters or enter Q to exit'
    end
end
end
  def self.init
    CashMachine.new.bank
  end
end
CashMachine.init