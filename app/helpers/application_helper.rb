module ApplicationHelper

	#ths is where the users station will be compared
	#with the API data results
	def hash_and_msg_generator(results, station)
		#we will have a couple of messages to tell the user 
		#whether or not a bus is coming soon
		@message =""
		#we want to provide the user with the route and
		#wehicle numbers for the approaching bus
		#the best way to store relates info is a hash!
		@buses = {}
		results.each do |result|
			if result['TIMEPOINT'].include? station
			#if the users selection matching an up
			#and coming bus stop in the API data we will
			#save that info in our hash
			@buses[result["ROUTE"]] = result["VEHICLE"]
			#the route is the key and
			#the vehicle is the value
		end
	end

		if @buses.count == 0
			#no buses have the users station as their
			#next stop
			@message = "Sorry, it's gonna be awhile."
		elsif @buses.count == 1
			#one bus will make the users station 
			#their next stop
			@message = "A bus is on its way."
		elsif @buses.count > 1
			#two or more buses will be making the users
			#station their next stop
			@message = "These buses will be coming soon."
		else  
			#just in case we end up with a negative number
			@message = "Oops...I think there was an error."
		end
	
	end 
end


