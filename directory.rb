#First create a student array
students = [
"Dr. Hannibal Lecter",
"Darth Vader",
"Nurse Ratched",
"Michael Corleone",
"Alex DeLarge",
"The Wicked Witch of the West",
"Terminator",
"Freddy Krueger",
"The Joker",
"Joffrey Baratheon",        
"Norman Bates"
]
#And then print them
puts "The students of Villains Academy"
puts "------------"
students.each { |student| puts student } 
# printing overall number of students- using print prevents new line being started
puts "Overall, we have #{students.count} great students"

