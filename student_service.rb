require 'date'

class StudentService
    extend Function
    
    def self.list_Students
       puts StudentData::STUDENTS
    end

    def self.search_student
        puts "enter name of student"
        enter_name=gets.chomp
        if enter_name.match?(/\d/)
            puts "invalid"
            return
        end
       
        if enter_name.empty?
            puts "empty string not allowed"
            return
        end
        student_name=enter_name.downcase
 
        for i in 0..StudentData::STUDENTS.length-1
            count=0
            s_name_from_data=StudentData::STUDENTS[i][:name]
            s_name=s_name_from_data.downcase
            
             
            for j in 0..enter_name.length
                if student_name[j] == s_name[j]
                    count+=1
                end
            end
            
            min_marks=StudentService.find_min?(StudentData::STUDENTS[i][:marks])
            sum_five_marks=StudentService.best_five(StudentData::STUDENTS[i][:marks],min_marks)
            if count == 0
                puts "no record"
                return
            end

            if count == enter_name.length
               
             puts "Name: #{StudentData::STUDENTS[i][:name]} |   percentage: #{sum_five_marks/5}%  "
             return
            end
           
        end
    
    end

    def self.view_student_tenure
        StudentData::STUDENTS.each do |s|
            current_date=Date.today
            join_date = Date.parse(s[:joined_at])
            days= (current_date - join_date).to_i
            puts "Name: #{s[:name]}   | Days: #{days}"
        end
    end

    def self.view_grade
        if StudentData::STUDENTS.empty?
            puts "no record found"
            return
        end
       
        StudentData::STUDENTS.each do |s|
         
            min_marks=StudentService.find_min?(s[:marks])
            sum_five_marks=StudentService.best_five(s[:marks],min_marks)
            percentage = sum_five_marks/5
            student_grade = StudentService.find_grade?(percentage)

            puts "Name: #{s[:name]} |  Percentage(%):#{percentage}% |  grade #{student_grade}" 
        end
    end

    def self.top_performer
        if StudentData::STUDENTS.empty?
            puts "no record found"
            return
        end
        
        students_marks=[]
        StudentData::STUDENTS.each do |s|
           
            min_marks=StudentService.find_min?(s[:marks])
            sum_five_marks=StudentService.best_five(s[:marks],min_marks)
            students_marks.push(sum_five_marks)
        end

        top_mark=StudentService.find_maximum?(students_marks)
        top_student = StudentData::STUDENTS.find do |s|
            
          min_marks=StudentService.find_min?(s[:marks])
             sum_five_marks=StudentService.best_five(s[:marks],min_marks)
            top_mark == sum_five_marks
        end
        puts "#{top_student[:name]} marks #{top_mark}"  
    end       
            

end

