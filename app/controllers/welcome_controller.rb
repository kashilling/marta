class WelcomeController < ApplicationController
  
include ApplicationHelper
require 'open-uri'
require 'json'

#create a landing page
def home
end

  def radioselect
  	@stations = ["North Springs", "Hamilton E. Holmes", "Lindbergh", 
  		"Midtown", "Georgia State", "Reynoldstown/Inman Park", "Dunwoody", 
  		"Lenox", "Sandy Springs", "Medical Center", "Doraville", "Chamblee",
  		"Brookhaven/Oglethorpe", "Arts Center", "North Avenue", "Civic 
  		Center", "Ashby", "Peachtree Center", "Vine City", "West End", 
  		"Airport", "College Park", "East Point", "Philips Arena/CNN Center",
  		"Garnett", "West Lake", "Bankhead", "Oakland City", "Lakewood/Ft. 
  		McPherson", "King Memorial", "Avondale", "East Lake", "Kensington", 
  		"Decatur", "Indian Creek", "Edgewood/Candler Park", "Inman Park/
  		Reynoldstown", "Buckhead"]
  	#Let's save them alphabetically - will be easier to find a particular station
	#when choosing from a list.
	@stations = @stations.sort_by{|item| item.downcase}
  end

  def yourbuses
  	#the passed parameter is set to an instance variable
	@station = params[:station]
	#here we pull the real-time info from MARTA, and put it in a hash. 
	#Copy and paste the URL and get familiar with what data is in there.
	@results = JSON.parse(open("http://developer.itsmarta.com/
		BRDRestService/BRDRestService.svc/GetAllBus").read)

	hash_and_msg_generator(@results, @station)
	#find this method in the Application Helper!
  end

  def yourbuses_dropdown
  end
end
