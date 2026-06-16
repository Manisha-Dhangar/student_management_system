class Menu
include Menu_Display
    def menu_print
        loop do
          print_menu
    
          option=gets.chomp.to_i
          case option
          when 1
          StudentService.list_students
          when 2
            StudentService.view_top
          when 3
            StudentService.search_student
          when 4
            StudentService.view_grade
          when 5
            StudentService.view_student_tenure
          when 6
          puts "exit"
          break
          return
          end
      end
   end
end

       
        
