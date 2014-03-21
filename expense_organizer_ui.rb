require './lib/purchase'
require './lib/category'
require './lib/expense_cat_join'
require 'pry'

system "clear"

def main_menu
  puts "Get your expenses under control!"
  puts "What would you like to do?"
  puts "\tPress 'e' to add a new purchase"
  puts "\tPress 'v' to view all your purchases"
  puts "\tPress 'x' to exit the program"

  input = gets.chomp.downcase

  case input
  when 'e'
    entry_menu
  when 'v'
    view_menu
  when 'x'
    puts "fine, file for bankruptcy now\n\n"
  else
    puts "Please enter a valid entry"
    main_menu
  end
end

def entry_menu
  puts "Type the name of the expense that you would like to add"
  description = gets.chomp
  puts "Got it! Now, please enter the amount"
  amount = gets.chomp
  puts "Wow, kind of pricey!!!! Okay, now, tell me if you made your purchase today? Press Y for yes"
  entry_menu_answer = gets.chomp.upcase
  case entry_menu_answer
    when "Y"
      date = Time.now.strftime("%Y/%m/%d")
    else
      puts "Please enter the date of your purchase in year-month-day format:"
      date = gets.chomp
   end
  new_purchase = Purchase.create({'description' => description, 'amount' => amount, 'date' => date})
  puts "Expense has been added to the database!!!!! Hasta NUNCA dinero :("

end


main_menu
