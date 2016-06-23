require_relative "../routing.rb"
#modificar luego el relative a lib/movielovers_lib.rb cuando extraiga definitivamente las clases 

RSpec.describe "Movie lovers" do 

  let (:ghost_search)
    instance_double("IMDBSearch",
      :check_results => [#<Imdb::Movie:0x1ea0b78 @id="0099653", @url="http://akas.imdb.com/title/tt0099653/combined", @title="Ghost (M\u00E1s all\u00E1 del amor) (1990)">])
      #IMDBSearch.new("movie").check_results array de urls con imagenes
  end

  

  it "If recive a empty array whith data movie after IMDB query" do
    expect(@first_cell.is_alive).to eq(true)
  end

end












RSpec.describe "Movie lovers" do 

  

  it "It must return true if a cell is alive" do
    expect(@first_cell.is_alive).to eq(true)
  end

end















##################################################################



  


