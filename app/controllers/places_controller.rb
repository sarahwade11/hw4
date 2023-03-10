class PlacesController < ApplicationController

  def index
   #@places = Place.where({ "user_id" => session["user_id"] })
   @places = Place.all
  
  end

  def show
    @place = Place.find_by({ "id" => params["id"] })
    @posts = Post.where({ "place_id" => @place["id"] })
  end

  def new
    @place = Place.new
  end

  def create
    if @current_user
      @places = Place.new
      @places["name"] = params["place"]["name"]
      @places["user_id"] = @current_user["id"]
      @places.save
    end
 
    redirect_to "/places"
  end

end 


