class ActorsController < ApplicationController
  def index
    @actors = Actor.all
  

    # @actors = Actor.search(params[:search])

    if params[:search]
      
      # @movies = Movie.all

      @actor = Actor.where("name LIKE ?", "%#{params[:search].capitalize}%")
    else
      @actor = Actor.all
    end

    respond_to do |format|
      format.html
      format.js
    end

  end

  def create
  end

  def new
  end

  def show
    @actor = Actor.find(params[:id])
    @movies = @actor.movies
  end
end
