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
    students.each { |student| puts "#{student[:name]} (#{student[:cohort]} cohort)" }
end

def print_footer(names)
    puts "Overall, we have #{names.count} great students"
end

#nothing will happpen until we call the methods
students = input_students
print_header
print(students)
print_footer(students)



