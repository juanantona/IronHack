require "pry"
require "sinatra"
require "sinatra/reloader" if development?
require "mini_magick"
require "imdb"
#require_relative "lib/movielovers_lib.rb"

#########################################
#FORM TILE
#########################################
get '/' do
  
  erb :form_ask_title

end

#########################################
#FORM SHOW POSTERS
#########################################

post "/show_posters" do
  
  IMDBSearchModuleWrapper.new(params[:movie_title])

  logger.info "MOVIE POSTERS UPLOADED!"
  
  erb :form_show_movies
  
end


#########################################
#CLASSES TO EXTRACT
#########################################

class IMDBSearchModuleWrapper

  attr_accessor :imdb_reply

  def initialize(title)
    @imdb_reply = []
    @imdb_reply = Imdb::Search.new(title)

    IO.write("ImdbQuery.txt", @imdb_reply.movies)
    binding.pry

    @movies = []
    process_IMDB_search_reply
  end
  

end

class IMDBMovieModuleWrapper

  def initialize(movies)
    @movies = movies
    @number_of_movies = 9
    built_movies_structure
  end

  def movie_query(movie_id)
    Imdb::Movie.new(movie_id)
  end  

  def built_movies_structure
    i = 0
    while i < @number_of_movies
      poster = movie_query(@movies[i][:id]).poster
      if poster != nil
        @movies[i][:poster] = poster
      end
      i=i+1  
    end
    #Siel tamaño del array es menor que 9 habrá que dar un mensaje al player   
    IO.write("posters.txt", @movies)
  end 

end

class Movie

def initialize(id, title, year, poster)
  @id = id
  @tile = title
end


end  

class MoviesGroup
  
  def process_IMDB_search_reply
    @imdb_reply.movies.each do |movie|
       @movies<<{:id => movie.id, :title  => movie.title, :year => movie.year}
    end
    IMDBMovieModuleWrapper.new(@movies)
  end 

end  





class DataProcessor

  def initialize(movies)
    @movies = movies
  end  

  def built_layout#construccion de cadenas HTML
    @movies = []
  end

end 