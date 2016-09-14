students = [
  {name: "Dr. Hannibal Lecter", cohort: :november},
  {name: "Darth Vader", cohort: :november},
  {name: "Nurse Ratched", cohort: :november},
  {name: "Michael Corleone", cohort: :november},
  {name: "Alex DeLarge", cohort: :november},
  {name: "The Wicked Witch of the West", cohort: :november},
  {name: "Terminator", cohort: :november},
  {name: "Freddy Krueger", cohort: :november},
  {name: "The Joker", cohort: :november},
  {name: "Joffrey Baratheon", cohort: :november},
  {name: "Norman Bates", cohort: :november},
]

def input_students
  students = []
  puts "Please enter the students' details. To finish, just hit return twice."
  puts "Enter name"
  name = gets.chomp
  if name.empty?
  else
    while !name.empty? do
  puts "Please enter the student's country of birth"
  country = (gets.chomp ||= "").empty? ? "Not known" : country
  puts 'Please enter their date of birth in the format DD/MM/YYYY'
  d_o_b = (gets.chomp ||= "").empty? ? "Not known" : d_o_b
  puts "And finally, please enter the student's cohort"
  cohort = (gets.chomp ||= "").empty? ? "Cohort unknown" : cohort
    students << {name: name, cohort: cohort, country: country, d_o_b: d_o_b}
    puts "Now we have #{students.count} students"
    puts "Please enter the name of the next student. If you're finished, hit Enter."
    name = gets.chomp
  end
end
  students
end

def print_header
  line_width = 50
puts ("The students of Villains Academy".center(line_width))
puts ("--------------".center(line_width))
end

def print(students)
  lookup_value = 0
  while lookup_value < students.length do
    student = students[lookup_value]
    if student[:name].start_with?("p", "P") && if student[:name].length < 12
      line_width = 50
        puts ("#{student[:name]} (#{student[:cohort]} cohort).".center(line_width))
        puts ("DOB: #{student[:d_o_b]}".center(line_width))
        puts ("Country of origin: #{student[:country]}".center(line_width))
      end
    end
    lookup_value += 1
  end
end

def print_footer(names)
  line_width = 50
  puts ("Overall, we have #{names.count} great students".center(line_width))
end


students = input_students
print_header
print(students)
print_footer(students)
