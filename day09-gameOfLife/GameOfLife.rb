require "pry"

class Cell

  attr_accessor :is_alive, :xCoordinate, :yCoordinate

  def initialize(xCoordinate, yCoordinate)
    @is_alive = true
    @xCoordinate=xCoordinate	
    @yCoordinate=yCoordinate
  end

end

class Organism

   def initialize(cells)
    @organism = cells 
   end	

   def include_cell?(cell)
     @organism.each do |organism_cell|
       return(true) if organism_cell=cell
     end
   end

   def are_neighbours(cell_1, cell_2)
     (cell_1.xCoordinate-cell_2.xCoordinate).abs<=1 && (cell_1.yCoordinate-cell_2.yCoordinate).abs<=1
   end
   
   def how_many_alive_neighbours(cell)
      @neighbours = 0
      aux_organism = @organism-[cell]
      aux_organism.each do |organism_cell| 
        @neighbours=@neighbours+1 if (are_neighbours(organism_cell, cell) && organism_cell.is_alive)
      end
      return @neighbours
   end
   
   def will_cell_live?(cell)
     return(false) if how_many_alive_neighbours(cell)<2 #Refactoring
     return(true) if (how_many_alive_neighbours(cell)>=2 && 
                       how_many_alive_neighbours(cell)<=3 && 
                       cell.is_alive)
     return(true) if (how_many_alive_neighbours(cell)==3 &&
                      cell.is_alive == false)
     return(false) if how_many_alive_neighbours(cell)>3 #Refactoring
     return(false)
   end 

end	

#######################################
#MAIN
#######################################

#     @first_cell = Cell.new(3,3)
#     @second_cell = Cell.new(4,4)
#     @third_cell = Cell.new(3,4)
#     @fourth_cell = Cell.new(2,2)
#     @fiveth_cell = Cell.new(3,2)
#     @organism = Organism.new([@first_cell, @second_cell, @third_cell, @fourth_cell, @fiveth_cell])

# xOrganism=[]
# yOrganism=[]
# @organism.each do |cell|
#   xOrganism << cell.xCoordinate
#   yOrganism << cell.yCoordinate
# end

# for 8 to 1
#    yOrganism.each |yCell|
#      if yCell==i
#        xOrganism.each |xCell|