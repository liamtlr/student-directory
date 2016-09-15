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
      if country == ''
        country = 'Unknown'
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

def print_from_input(input_arr)
  line_width = 50
  lookup_value = 0
  while lookup_value < input_arr.length
    student = input_arr[lookup_value]
      puts ("#{student[:name]} (#{student[:cohort]} cohort)".center(line_width))
      puts ("Country of origin: #{student[:country]}".center(line_width))
      puts ("Date of birth: #{student[:d_o_b]}".center(line_width))
      puts
    lookup_value = lookup_value + 1
  end
end

def print_header
  line_width = 50
  puts ("The students of Villains Academy".center(line_width))
  puts ("--------------".center(line_width))
  puts
end


def print(input_arr)
  line_width = 50
  lookup_value = 0
  while lookup_value < input_arr.length
    student = input_arr[lookup_value]
    if student[:name].start_with?("d", "D") && if student[:name].length < 17
      puts ("#{student[:name]} (#{student[:cohort]} cohort).".center(line_width))
      puts ("Country of origin: #{student[:country]}".center(line_width))
    end
  end
    lookup_value = lookup_value + 1
  end
end



def print_by_cohort(input_arr)
  line_width = 50
  cohorts = [:may, :september, :november]
  cohorts_string = ["May", "September", "November"]
  lookup = 0
  while lookup < cohorts.length
    single_cohort = input_arr.select{ |x| x[:cohort] == cohorts[lookup]}
    puts ("#{cohorts_string[lookup]} cohort:".center(line_width))
    single_cohort.each do |x|
      puts ("Name: #{x[:name]}".center(line_width))
      puts ("Country of origin: #{x[:country]}".center(line_width))
      puts
    end
    lookup = lookup + 1
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

# ----------
@students =[]

def print_menu
  puts "What would you like to do?"
  puts "To input students, press 1"
  puts "To view the list of students, press 2"
  puts "To save the list of students to and output file, press 3"
  puts "To load the current list of students, press 4"
  puts "To exit, press 9"
end

def show_students
  print_header
  print_from_input(@students)
  print_footer(students)
end

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

def process(selection)
  case selection
  when "1"
    @students = input_students
  when "2"
    print_header
    print_from_input(@students)
    print_footer(@students)
  when "3"
    save_students
  when "4"
    load_students
  when "9"
    exit
  else
    puts "I don't know what you mean, try again"
  end
end

def save_students
  file = File.open("students.csv", "w")
  @students.each do |student|
    student_data = [student[:name], student[:country], student[:d_o_b], student[:cohort]]
    csv_line = student_data.join(", ")
    file.puts csv_line
  end
  file.close
end

def load_students
  file = File.open("students.csv", 'r')
  file.readlines.each do |lines|
    name, country, d_o_b, cohort = lines.split(", ")
    @students << {name: name, country: country, d_o_b: d_o_b, cohort: cohort}
  end
  file.close
  puts @students
end

interactive_menu


# print_by_cohort(students_fixed)
# print(students_fixed)

# students = input_students
# print_header
# print_from_input(students)
# print_footer(students)
