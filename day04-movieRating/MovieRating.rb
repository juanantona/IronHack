require "imdb"
require "Pry"

##########################
#CLASS DECLARATION
##########################

class IMDBRating

  def initialize
   @movies = []
   @rating = []
  end	
  
  def process_file
  	return @movies = IO.read("movies.txt").split("\n")
  end	

  def rating
    process_file.each do |movie|
       @rating << Imdb::Movie.new("#{Imdb::Search.new(movie).movies[0].id}").rating.to_i
    end
    puts @rating 
  end

  def format
  	for i = @rating.maxvalue to 1 by -1
  	  @movies.each do |movie|
  	  	puts "|" + [if movie.rating > i "#"," "] + "|"
  	  end	  
    end	
  end

end

##########################
#MAIN
##########################

IMDBRating.new.rating	


