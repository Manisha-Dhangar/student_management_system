module Function
    def find_min?(marks)
      
       min_marks=marks[0]
          for i in 0..marks.length-1
            if min_marks > marks[i]
                min_marks = marks[i]
             end
          end
        min_marks
        
    end

    def best_five(marks,min_marks)
       sum_of_five=0
       for i in 0..marks.length-1
        unless marks[i] == min_marks
          sum_of_five+=marks[i]
        end
      end
      sum_of_five
    end

    def find_maximum?(students_marks)
      maximum_mark=students_marks[0]
      for i in 1..students_marks.length-1
        if students_marks[i] > maximum_mark
          maximum_mark = students_marks[i]
        end
      end
      maximum_mark
    end

    def find_grade?(percentage)
      if percentage >= 90 && percentage < 99
        student_grade="A+"
      elsif percentage >= 85 && percentage < 90
        student_grade ="A"
      elsif percentage >= 75 && percentage < 85
          student_grade ="B"
            
             elsif percentage >= 60 && percentage < 75
             student_grade ="C"
         
              else
             student_grade="D"            
            end
            student_grade
    end
end