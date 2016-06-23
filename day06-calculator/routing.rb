require "pry"
require "sinatra"
require "sinatra/reloader" if development?
require_relative "class_declaration_calculator_exercise.rb"
enable :sessions

#########################################
#INI
#########################################
get "/" do
  erb :login
end

#########################################
#LOGIN
#########################################
post "/home_page" do
  
  @user_name = "juan"
  @user_password = "123"
  
  session[:user_valid] = false

  if session[:user_valid] == true || (params[:user_name] == @user_name && params[:user_password] == @user_password)
    logger.info "LOGIN CORRECT!"
    session[:user_valid] = true
    erb :home_page
  else
    logger.info "LOGIN INCORRECT!"
    session[:user_valid] = false
    erb :login 
  end  
end

#########################################
#LOGIN
#########################################
post "/calculator" do
  if session[:user_valid] == false
    redirect to("/")
  end  

  case params[:operation_type]
  when "add"
    session[:operation_type] = "add"
  when "substract"
    session[:operation_type] = "substract"
  when "multiply"
    session[:operation_type] = "multiply"
  when "divide"
    session[:operation_type] = "divide"
  end
  erb :form_numbers    

end

#########################################
#LOGIN
########################################

post "/result" do
  
  @number1 = params[:number1].to_i
  @number2 = params[:number2].to_i
  
  case session[:operation_type]
  when "add"
    Operations.new.add(@number1, @number2).to_s
    #erb :result

  when "substract"
    Operations.new.substract(@number1, @number2).to_s
   
  when "multiply"
    Operations.new.multiply(@number1, @number2).to_s
  when "divide"
    Operations.new.divide(@number1, @number2).to_s
  end

end
