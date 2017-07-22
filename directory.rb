
def interactive_menu
  students = []
# 1. Print the menu and ask the user what to do
# 2. Read the input and save it to a variable
# 3. Do what the user has asked
# 4. Repeat from step 1
  loop do 
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit"
    selection = gets.chomp
    case selection
      when "1"
        students = input_students
      when "2"
        print_header
        print(students)
        print_footer(students)
      when "9"
        exit
      else
        puts "I don't know what you meant, try again"
    end  
  end 
end

# Define a new method to get student input
def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice" 
 #Create empty array for students to go into
  students = []
# Get the first name
  name = gets.chomp
# While the name is not empty, repeat this code. Empty method is part of the string class
  while !name.empty? do
# Add the student hash to the array. << is the shovel operator and is used to add things into an array
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
# get another name from the user
    name = gets.chomp
  end
# Return the array of students
  students
end


# And then print them
def print_header
  puts "The students of Villains Academy"
  puts "------------"
end

def print(students)
  students.each.with_index(1) { |student, index| puts "#{index} #{student[:name]} (#{student[:cohort]} cohort)" }
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end


# Call the methods:
interactive_menu

