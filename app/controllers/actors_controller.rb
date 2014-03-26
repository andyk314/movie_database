class ActorsController < ApplicationController
  def index

    @actors = Actor.all
    @movies = Movie.all
    # @actors = Actor.search(params[:search])
    if params[:search]    
      # @movies = Movie.all
      @actor = Actor.where("name LIKE ?", "%#{params[:search].capitalize}%")
    else
      @actor = Actor.all
    end
  end

  def create
  end

  def new
  end

    def show
    @actor = Actor.find(params[:id])
    @movies = @actor.movies.where("total_revenue > ?", 10000000).where("budget > ?", 100) .order("total_revenue DESC")
    @fresh = @actor.movies.where("freshness >= ?", 70).order("freshness DESC")
    @rotten = @actor.movies.where("freshness <= ?", 60).order("freshness ASC")
  end
end
