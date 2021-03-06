# Author: Natalia Kozoriz
# A bookseller has lots of books classified in 26 categories labeled A, B, ... Z
# Each book has a code c of 3, 4, 5 or more capitals letters.
# The 1st letter of a code is the capital letter of the book category.
# In the bookseller's stocklist each code c is followed by a space and by
# a positive integer n (int n >= 0) which indicates the
# quantity of books of this code in stock.
# For example an extract of one of the stocklists could be:
# L = ["ABART 20", "CDXEF 50", "BKWRK 25", "BTSQZ 89", "DRTYM 60"]
# You will be given a stocklist (e.g. : L) and a list of
# categories in capital letters e.g: M = ["A", "B", "C", "W"]
# and your task is to find all the books of L with codes
# belonging to each category
# of M and to sum their quantity according to each category.
# For the lists L and M of example you have to return the string:
# (A : 20) - (B : 114) - (C : 50) - (W : 0)
# If L or M are empty return string is ""
# In the result codes and their values are in the same order as in M
def stockList(books, catalogs)
  return '' if books.empty? || catalogs.empty?

  books = Hash[books.map { |el| el.split ' ' }]
  books.select! { |key, _val| catalogs.join.include? key[0] }
  books = Hash[books.values.map(&:to_i).zip(books.keys)].invert
  answer = Hash[catalogs.product([0])]
  books.select { |key, val| answer[key[0]] += val if answer.key?(key[0]) }
  "(#{answer.map { |k, v| "#{k} : #{v}" }.join(') - (')})"
end

def run_task
  print 'Enter array of numbers: (without [], only numbers like:
  "ABART 20", "CDXEF 50")'
  books = gets.chomp.split(',').map { |s| s.to_i }
  print 'Enter array of numbers: (without [], only numbers like:
  "A", "B")'
  catalogs = gets.chomp.split(',').map { |s| s.to_i }
  puts "Answer is: #{stockList(books, catalogs)}"
end
