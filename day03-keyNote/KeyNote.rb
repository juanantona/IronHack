require "Pry"
require "HighLine"

##########################
#CLASS DECLARATION
##########################

class KeynotePresentation

  def initialize(arr_pagination)
    @screen_size = HighLine::SystemExtensions.terminal_size
    @arr_pagination = arr_pagination
    @command
    @@index = 0
  end	
  
  def navigation
    show_page(process_pagination(@arr_pagination), @@index)
    
    while @command != "exit"
      print ">"
      @command = gets.chomp
      begin #En caso de que se meta un comando erroneo capturo el error
        show_page(process_pagination(@arr_pagination), process_index(@@index, @command))
      rescue
        puts "Wrong command"
      end    
    end	
  end
  
  def process_index(index, command)
    case command
    when "next"
      if index < @arr_pagination.length - 1	
        return @@index = index.next
      end
      return @@index
    when "previous"  
      if index > 0	
        return @@index = index.pred
      end
      return @@index
    end   

  end

  def show_page(arr, index)
    puts arr[index]
  end

  def process_pagination(arr)
  	arr.map do |page|
  	  "\n"*((@screen_size[1]-1)/2) + 
  	  " "*((@screen_size[0]-page.size)/2) + page + " "*((@screen_size[0]-page.size)/2) +
  	  "\n"*((@screen_size[1]-1)/2)
  	  end
  end	

end 

class Text_Process
  
  def initialize
    @file_source = "keynote.txt"
    @arr_text_source
  end	
  
  def load_text_to_array
  	return @arr_text_source = IO.read("keynote.txt").split("\n----\n")
  end

end	

##########################
#MAIN
##########################

KeynotePresentation.new(Text_Process.new.load_text_to_array).navigation