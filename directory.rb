#First create a student array
students = [
  {name: "Dr. Hannibal Lecter", cohort: :november},
  {name: "Darth Vader", cohort: :november},
  {name: "Nurse Ratched", cohort: :november},
  {name: "Michael Corleone", cohort: :november},
  {name: "Alex DeLarge", cohort: :november},
  {name: "The Wicked Witch of the west", cohort: :november},
  {name: "Terminator", cohort: :november},
  {name: "Freddy Kreuger", cohort: :november},
  {name: "The Joker", cohort: :november},
  {name: "Norman Bates", cohort: :november}
]

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
print_header
print(students)
print_footer(students)



