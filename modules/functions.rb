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
end