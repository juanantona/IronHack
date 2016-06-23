class ConcertsController < ApplicationController

  def index
    @title="Concerts Index"
  	@concerts = Concert.all
  end 

  def new
    @concert = Concert.new
  end	

  def show
    @concert = Concert.find(params[:id])
    @comments = @concert.comments
    render "show"
  end  

  def create
  	@concert = Concert.new 
    
    entry_params.each do |key, value|
      @concert[key] = value
    end  

    if @concert.save
      flash[:notice] = "Concert created successfuly"

      redirect_to concerts_path
    else
      flash[:alert] = "Please, try again"
      render "new"
    end     

  end

private

  def entry_params
    params.require(:concert).permit(:band, :venue, :city, :date, :price, :description)
  end 

end
