require 'date'
class StudentService
    extend Function
    def self.list_students
        $students.each do |s|
            puts s
         #   puts "Name: #{s.full_name}  |Marks: #{s.marks} |joined_at: #{s.joined_at}
        end
    end
    def self.search_student
        puts "enter name of student"
        student_name=gets.chomp


        student=$students.find do |s|
            
           s[:name]==student_name
        end
        puts "Name: #{student[:name]} marks: #{student[:marks]} joined_at: #{student[:joined_at]}"
    end
    def self.view_student_tenure
        $students.each do |s|
            current_date=Date.today
            
            
            join_date = Date.parse(s[:joined_at])
            days= (current_date - join_date).to_i
            puts "Name: #{s[:name]}   | Days: #{days}"
        end
    end
    def StudentService.view_grade
         $students.each do |s|
          min_marks=StudentService.find_min?(s[:marks])
          sum_five_marks=StudentService.best_five(s[:marks],min_marks)
          percentage = sum_five_marks/5
          
            
         end
        
            
        
    
    
     end

end

