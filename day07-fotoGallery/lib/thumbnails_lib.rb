class Images

  def existing_images
    @images = Dir.entries("public/images/thumbnails")
    @images.shift
    @images.shift
    @thumbnails_gallery = ""
    @images.each do |thumbnail| 
      @thumbnails_gallery = @thumbnails_gallery+"<a href=\"/images/big_"+thumbnail+"\"><img src = /images/thumbnails/"+thumbnail+"></a>\n"
    end
    return @thumbnails_gallery
  end

  def save_image(image, path)
    image.write(path)
  end	

end  
