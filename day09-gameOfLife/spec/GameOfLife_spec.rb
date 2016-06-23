require_relative "../GameOfLife.rb"

RSpec.describe "Cell behaviour" do 

  before :each do 
    @first_cell = Cell.new(3,3)
    @second_cell = Cell.new(4,4)
    @organism = Organism.new([@first_cell, @second_cell])
  end	
    
  it "Pass if a cell exists" do
    expect(@first_cell)
  end

  it "It must return true if a cell is alive" do
    expect(@first_cell.is_alive).to eq(true)
  end

  it "It must return true if a cell lives into a organism" do
    expect(@organism.include_cell?(@first_cell)).to eq(true)
  end

  it "It must return true if a cell have a neighbour" do
    expect(@organism.are_neighbours(@first_cell, @second_cell)).to eq(true)
  end
  
  it "It must return 1 if a cell have 1 alive neighbour" do
    expect(@organism.how_many_alive_neighbours(@first_cell)).to eq(1)
  end
  
  it "It must return false (it woesn't live) if a live cell have fewer than 2 alive neighbours" do
    expect(@organism.will_cell_live?(@first_cell)).to eq(false)
  end

end

##################################################################

RSpec.describe "Cell behaviour" do 

  before :each do 
    @first_cell = Cell.new(3,3)
    @second_cell = Cell.new(4,4)
    @third_cell = Cell.new(3,4)
    @organism_2_neighbours = Organism.new([@first_cell, @second_cell, @third_cell])
  end 

  it "It must return true (it will live) if a cell have two/three alive neighbours" do
    expect(@organism_2_neighbours.will_cell_live?(@first_cell)).to eq(true)
  end

  it "It must return false (it woesn't live) if a dead cell have two/three alive neighbours" do
    @first_cell.is_alive = false
    expect(@organism_2_neighbours.will_cell_live?(@first_cell)).to eq(false)
  end

end

##################################################################

RSpec.describe "Cell behaviour" do 

  before :each do 
    @first_cell = Cell.new(3,3)
    @second_cell = Cell.new(4,4)
    @third_cell = Cell.new(3,4)
    @fourth_cell = Cell.new(2,2)
    @organism_3_neighbours = Organism.new([@first_cell, @second_cell, @third_cell, @fourth_cell])
  end 

  it "It must return true (it will live) if a dead cell have three alive neighbours" do
    @first_cell.is_alive = false
    expect(@organism_3_neighbours.will_cell_live?(@first_cell)).to eq(true)
  end

end

##################################################################

RSpec.describe "Cell behaviour" do 

  before :each do 
    @first_cell = Cell.new(3,3)
    @second_cell = Cell.new(4,4)
    @third_cell = Cell.new(3,4)
    @fourth_cell = Cell.new(2,2)
    @fiveth_cell = Cell.new(3,2)
    @organism_4_neighbours = Organism.new([@first_cell, @second_cell, @third_cell, @fourth_cell, @fiveth_cell])
  end 

  it "It must return false (it woesn't live) if a cell have mor than 4 alive neighbours" do
    expect(@organism_4_neighbours.will_cell_live?(@first_cell)).to eq(false)
  end

end