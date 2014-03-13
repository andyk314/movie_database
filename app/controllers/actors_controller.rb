class ActorsController < ApplicationController
  def index
    @actors = Actor.all
    @actors = Actor.search(params[:search])
    @movies = Movie.all

  end

  def new
  end

  def show
  end
end
