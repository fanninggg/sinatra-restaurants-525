require_relative "config/application"
require "sinatra"
require "sinatra/reloader"
require "sinatra/activerecord"

# See all restaurants
get "/" do
	@restaurants = Restaurant.all
  erb :index
end

# See detailed information about a single restaurant
get "/restaurants/:id" do
	restaurant_id = params["id"]
	@restaurant = Restaurant.find(restaurant_id)
	erb :show
end

# Add a restaurant
post "/restaurants" do
	# 1. Take the user input from the params and store it in a variable 
	name = params["name"]
	city = params["city"]
	# 2. Create a new instance of restaurant with that data
	new_restaurant = Restaurant.create(name: name, city: city)
	# 3. Redirect them
	redirect "/restaurants/#{new_restaurant.id}"
end