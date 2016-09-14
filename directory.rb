students_fixed = [
  {name: "Dr. Hannibal Lecter", cohort: :november, country: "USA"},
  {name: "Darth Vader", cohort: :september, country: "Russia"},
  {name: "Nurse Ratched", cohort: :may, country: "Germany"},
  {name: "Michael Corleone", cohort: :may, country: "Suriname"},
  {name: "Alex DeLarge", cohort: :may, country: "Germany"},
  {name: "The Wicked Witch of the West", cohort: :september, country: "Austria"},
  {name: "Terminator", cohort: :november, country: "Latvia"},
  {name: "Freddy Krueger", cohort: :november, country: "Lithuania"},
  {name: "The Joker", cohort: :september, country: "Spain"},
  {name: "Joffrey Baratheon", cohort: :may, country: "Portugal"},
  {name: "Norman Bates", cohort: :november, country: "Canada"},
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
      country = gets.chomp
      if country == ""
        country = "Unknown"
      end
      puts 'Please enter their date of birth in the format DD/MM/YYYY'
      d_o_b = gets.chomp
      if d_o_b == ''
        d_o_b = 'Unknown'
      end
      puts "And finally, please enter the student's cohort"
      cohort = gets.chomp
      if cohort == ""
        cohort = 'Unknown'
      end
      students << {name: name, cohort: cohort, country: country, d_o_b: d_o_b}
      if students.count == 1
        puts "Now we have #{students.count} student"
      else
      puts "Now we have #{students.count} students"
    end
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

def print_by_cohort(students_fixed)
line_width = 50

  students_fixed = [
    {name: "Dr. Hannibal Lecter", cohort: :november, country: "USA"},
    {name: "Darth Vader", cohort: :september, country: "Russia"},
    {name: "Nurse Ratched", cohort: :may, country: "Germany"},
    {name: "Michael Corleone", cohort: :may, country: "Suriname"},
    {name: "Alex DeLarge", cohort: :may, country: "Germany"},
    {name: "The Wicked Witch of the West", cohort: :september, country: "Austria"},
    {name: "Terminator", cohort: :november, country: "Latvia"},
    {name: "Freddy Krueger", cohort: :november, country: "Lithuania"},
    {name: "The Joker", cohort: :september, country: "Spain"},
    {name: "Joffrey Baratheon", cohort: :may, country: "Portugal"},
    {name: "Norman Bates", cohort: :november, country: "Canada"},
  ]

cohort_may = students_fixed.select{ |x| x[:cohort] == :may}
cohort_sept = students_fixed.select{ |x| x[:cohort] == :september}
cohort_nov = students_fixed.select{ |x| x[:cohort] == :november}

puts ("May cohort:".center(line_width))
puts
cohort_may.each do |x|
  puts ("Name: #{x[:name]}".center(line_width))
  puts ("Country of origin: #{x[:country]}".center(line_width))
  puts
end
puts ("September cohort:".center(line_width))
puts
cohort_sept.each do |x|
  puts ("Name: #{x[:name]}".center(line_width))
  puts ("Country of origin: #{x[:country]}".center(line_width))
  puts
end
puts ("November cohort:".center(line_width))
puts
cohort_nov.each do |x|
  puts ("Name: #{x[:name]}".center(line_width))
  puts ("Country of origin: #{x[:country]}".center(line_width))
  puts
end
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
if names.count == 1
  puts ("Overall, we have #{names.count} great student".center(line_width))
else
  puts ("Overall, we have #{names.count} great students".center(line_width))
end
end


# students = input_students
# print_header
# print(students)
# print_footer(students)

print_by_cohort(students_fixed)
