require 'date'

class StudentService
    extend Function
    
    def self.list_Students
       puts StudentData::STUDENTS
    end

    def self.search_student
        puts "enter name of student"
        enter_name=gets.chomp
        student_name=enter_name.downcase
         
        if student_name.match?(/\d/)
            puts "invalid"
            return
        end
        if student_name.empty?
            puts "empty string not allowed"
            return
        end
        check_record=0
        for i in 0..StudentData::STUDENTS.length-1
            count=0
            s_name_from_data=StudentData::STUDENTS[i][:name]
            s_name=s_name_from_data.downcase
            for j in 0..enter_name.length
                if student_name[j] == s_name[j]
                    print=true
                    count+=1
                    check_record+=1
                end
            end
            
            min_marks=StudentService.find_min?(StudentData::STUDENTS[i][:marks])
            sum_five_marks=StudentService.best_five(StudentData::STUDENTS[i][:marks],min_marks)
            if count == enter_name.length && print
                puts "Name: #{StudentData::STUDENTS[i][:name]} |   percentage: #{sum_five_marks/5}%  "
            end 
        
            if check_record == 0
                puts "no record"
              return
            end
        end
    end

    def self.view_student_tenure
        student_list=[]
        StudentData::STUDENTS.each do |s|
            student_hash={}
            current_date=Date.today
            join_date = Date.parse(s[:joined_at])
            days= (current_date - join_date).to_i
            student_hash[:id]=s[:id]
            student_hash[:name]=s[:name]
            student_hash[:days]=days
            student_list.push(student_hash)
        end
        sorted_days_list=student_list.sort_by{|l| -l[:days]}
        puts sorted_days_list
    end

    def self.view_grade
        if StudentData::STUDENTS.empty?
            puts "no record found"
            return
        end
         student_list=[]
        StudentData::STUDENTS.each do |s|
           student_hash={}
            min_marks=StudentService.find_min?(s[:marks])
            sum_five_marks=StudentService.best_five(s[:marks],min_marks)
            percentage = sum_five_marks/5
            student_grade = StudentService.find_grade?(percentage)
            result="pass"
            if percentage < 33
               result="fail"
            end
            student_hash[:id]=s[:id]
            student_hash[:name]=s[:name]
            student_hash[:percentage]=percentage
            student_hash[:grade]=student_grade
            student_hash[:result]=result
            student_list.push(student_hash)
        end
         student_sorted_grade=student_list.sort_by{|s| -s[:percentage]}
         puts student_sorted_grade
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
            studennt_hash={}
            min_marks=StudentService.find_min?(s[:marks])
            sum_five_marks=StudentService.best_five(s[:marks],min_marks)
            top_mark == sum_five_marks

        end
        puts "#{top_student[:name]} marks #{top_mark}"  
    end       
            

end

