class SiteController < ApplicationController

	def home
	  @title="Home Site"
	  
      @concerts=Concert.where(date: (Time.now - 1.month)..Time.now) 
	  render "home"	
	end



end
