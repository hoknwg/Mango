class PlacesController < ApplicationController

	#Add a before filter to new and create
	before_action :authenticate_user!, :only => [:new, :create]

	def index
		@places = Place.all
	end

	def new
		@place = Place.new
	end

	def create
		#Place.create(place_params)
		current_user.places.create(place_params)
		redirect_to root_path
	end

	def show
		@place = Place.find(param[:id])
	end
	

	private 

	def place_params
		params.require(:place).permit(:name, :description, :address)
	end

end
