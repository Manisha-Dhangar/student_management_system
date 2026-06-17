class Menu
include Menu_Display
    def menu_print
       previous_opt="abc"

        loop do
          print_menu
    
          option=gets.chomp.to_i
           if option==previous_opt
             puts "same option"
             redo
            end
          previous_opt=option
          case option
          when 1
            StudentService.list_Students
          when 2
           StudentService.top_performer
          when 3
            StudentService.search_student
          when 4
            StudentService.view_grade
          when 5
            StudentService.view_student_tenure
          when 6
          puts "exit"
          break
          else
            puts "invalid"
          
          end
      end
   end
end

       
        
