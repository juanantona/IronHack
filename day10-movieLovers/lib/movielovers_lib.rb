class IMDBSearch

  def initialize(movie)
    @id_movies = []
    Imdb::Search.new(movie).movies.each{|movie| @id_movies<<movie.id}
    @url_posters = []   
    @id_movies.each do |id_movie|
       poster = Imdb::Movie.new(id_movie).poster
       @url_posters << poster if poster!=nil
    end   
  end 

  def check_results
    IO.write("posters2.txt",  @url_posters) 
    
  end 
  
  def get_posters
    @movies = []
  end

end 