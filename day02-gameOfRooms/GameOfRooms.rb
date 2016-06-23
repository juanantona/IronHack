require "pry"

#########################
#CLASS DECLARATION
#########################

class Room
  
  attr_accessor :id, :description, :options

  def initialize(id, description)
    @id = id
    @description = description
	  @options = []
  end

  def add_option(direction, next_id)
  	@options.push([direction, next_id])
  end	

end

class Map
  
  attr_accessor :rooms

  def initialize
  	@rooms = []
  end

  def add_room(room)
    @rooms.push(room)
  end	

end

class Game
  
  attr_accessor :current_position, :player_positions

  def initialize(stage)
  	@current_stage = stage
  	@current_position = 0
  	@player_positions = [@current_position]
  end

  def execute_command(command)
  	@current_stage.rooms.each do |rooms| #Recorro todas las habitaciones del mapa
      if rooms.id == @current_position
  	    options_number = 1
        rooms.options.each do |options|
          if options[0] == command #Si el comando ejecutado corresponde con una de las opciones
            @current_position = options[1]
            @player_positions.push(options[1])
            return #Meto un return para salir del bucle options.each
          end # if
          if rooms.options.length == options_number
            puts "Wrong command.Please, try again." #Sólo entro aquí si llego al final del bucle de opciones
          end
          options_number = options_number + 1
        end #each options	
  	  end #if	
    end #each rooms
  end #end execute_command

  def play_game
    puts "You are in the first room #{@current_position}"
    puts @current_stage.rooms[@current_position].description
    puts "Where do you want to go?"
    puts ">"
    while @current_position != 5
      command = gets.chomp
      execute_command(command)
      puts "You are in the room #{@current_position}"
      puts @current_stage.rooms[@current_position].description
      puts "Where do you want to go?"
      puts ">"
    end
    puts "You are the best!"
    puts @player_positions
  end 

  def pickup_object

  end  

end	

#########################
#INSTANCE STAGE 0
#########################

room0 = Room.new 0, "You can go south"
room0.add_option "S", 1
room1 = Room.new 1, "You can go south or west"
room1.add_option "S", 2 #room1 --> en lugar de pasar un id podría pasar el objeto entero
room1.add_option "W", 4
room2 = Room.new 2, "You can go west"
room2.add_option "W", 3
room3 = Room.new 3, "You can go north or south"
room3.add_option "N", 4
room3.add_option "S", 5
room4 = Room.new 4, "You can go east or south"
room4.add_option "E", 1
room4.add_option "S", 3
room5 = Room.new 5, "Finish!"

stage0 = Map.new
stage0.add_room(room0)
stage0.add_room(room1)
stage0.add_room(room2)
stage0.add_room(room3)
stage0.add_room(room4)
stage0.add_room(room5)

#########################
#MAIN
#########################

juan = Game.new(stage0)
juan.play_game