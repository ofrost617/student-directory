#define a new method to get student input
def input_students
    puts "Please enter the names of the students"
    puts "To finish, just hit return twice"
    # Create an empty array
    students = []
    #get the first name
    name = gets.chomp
    #while the name is not empty, repeat this code. empty method is part of the String class
    while !name.empty? do
        #add the student hash to the array. << is the shovel operator and is used to add things into an array
        students << {name: name, cohort: :november}
        puts "Now we have #{students.count} students"
        #get another name from the user
        name = gets.chomp
    end
    #return the array of students
    students
end


#And then print them
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

def interactive_menu
  students = [] # declared as an empty array before the loop so that it is available to several iterations of the loop
  loop do
    # 1. Print the menu and ask the user what to do
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit"
    # 2. Read the input and save it to a variable
    selection = gets.chomp
    #3. do what the user has asked
    case selection
      when  "1"
        students = input_students
      when "2"
        print_header
        print(students)
        print_footer(students)
      when "9"
        exit # this wil cause the program to terminate
      else 
        puts "I don't know what you meant, try again"
      end
  end
end
  


#nothing will happpen until we call the methods
interactive_menu
students = input_students
print_header
print(students)
print_footer(students)


# Step 8.2 
# only print students names starting with certain letter:
# either: change while statement to !name.empty? && name.start_with?("d") ... 
        # BUT this would stop inputs as soon as a name doesn't begin with "d"
# or: use array.select

#students.each do |student| 
  #  puts student 
   # student.first == "d"
#end 

  #  def select_students_starting_with(students, letter)
   #   students.select { |str| str.start_with?("d") }
    #end
