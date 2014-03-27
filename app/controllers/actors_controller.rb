class ActorsController < ApplicationController
  def index
    @movies = Movie.all
      if params[:search]
      @actor = Actor.where("name LIKE ?", "%#{params[:search].capitalize}%")
    else
      @actor = Actor.all
      @actors = Actor.all
      @actors_pagination = Actor.all.paginate(page: params[:page], per_page: 8)
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
