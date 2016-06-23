require "pry"
require "sinatra"
require "sinatra/reloader" if development?
require "mini_magick"
require_relative "lib/thumbnails_lib.rb"
enable :sessions

#########################################
#INI
#########################################
get '/upload_image' do
  
  @thumbnails_gallery = Images.new.existing_images 
  erb :form_upload

end

#########################################
#UPLOAD AND SHOW THUMBNAILS
#########################################

post "/upload_image" do
  
  @image_input = MiniMagick::Image.open(params[:file_name][:tempfile].path)
  #grabo foto grande
  @big_path = "public/images/"+"big_"+params[:file_name][:filename]
  Images.new.save_image(@image_input, @big_path)
    
  #grabo foto pequeña
  @small_path = "public/images/thumbnails/"+params[:file_name][:filename]
  Images.new.save_image((@image_input.resize "100x100"), @small_path)
    
  logger.info "IMAGE UPLOADED!"
  
  redirect "/upload_image"

end