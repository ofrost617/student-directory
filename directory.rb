@students = []

def interactive_menu
# 1. Print the menu and ask the user what to do
# 2. Read the input and save it to a variable
# 3. Do what the user has asked
# 4. Repeat from step 1
  loop do 
    print_menu
    process(STDIN.gets.chomp)
  end
end

def process(selection)
    case selection
      when "1"
        input_students
      when "2"
        show_students
      when "3"
        save_students
      when "4"
        load_students
      when "9"
        exit
      else
        puts "I don't know what you meant, try again"
    end  
  end 

#Refactoring step 10- breaking down interactive_menu into smaller methods. These methods are defined OUTSIDE of interactive_menu because you can't 
# define a method within a method
  # Define a print_menu method
def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit"
end
  # Define a show_students method
def show_students
  print_header
  print_students_list(@students)
  print_footer(@students)
end


# Define a new method to get student input
def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice" 
 #Create empty array for students to go into
# Get the first name
  name = STDIN.gets.chomp
# While the name is not empty, repeat this code. Empty method is part of the string class
  while !name.empty? do
# Add the student hash to the array. << is the shovel operator and is used to add things into an array
    @students << {name: name, cohort: :november}
    puts "Now we have #{@students.count} students"
# get another name from the user
    name = STDIN.gets.chomp
  end
# Return the array of students
  @students
end


# And then print them
def print_header
  puts "The students of Villains Academy"
  puts "------------"
end

def print_students_list(students)
  students.each.with_index(1) { |student, index| puts "#{index} #{student[:name]} (#{student[:cohort]} cohort)" }
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

def save_students
  # Open the file for writing
  file = File.open("students.csv", "w") #Here we have opened a file using the .open method and saved the file as a variable called 'file'
  # Iterate over the array of students
  @students.each do |student| #Here we iterate over the array of students, processing one at a time into the file
    student_data = [student[:name], student[:cohort]] #on every iteration we take the data in the hash and create a new array with it
    # to show the student name and cohort
    csv_line = student_data.join(",") # we then convert the new array into a comma separated string here, .join turns the elements of the array
    # it's called on (in this case student_data), using it's argument as a separator
    file.puts csv_line # calling puts on a file writes to a file not the screen, in this case it's writing csv_line to a file
  end
  file.close
end 

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(',')
    @students << {name: name, cohort: cohort.to_sym}
  end
  file.close
end

def try_load_students
  filename = ARGV.first
  return if filename.nil?
  if File.exists?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else
    puts "Sorry, #{filename} doesn't exist"
    exit
  end
  
end


# Call the methods:
load_students
interactive_menu

