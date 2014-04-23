class ActorsController < ApplicationController
  require 'will_paginate/array'

  def index
    @movies = Movie.all
    @actor = Actor.new

    # Actor search form
    if params[:search]
    # @actor = Actor.where("name LIKE ?", "%#{params[:search].capitalize}%")
      @actors = Actor.where(name: /^#{Regexp.escape(params[:search])}/i)
    else
      @actors = Actor.all.paginate(page: params[:page], per_page: 8)
    end

    # respond_to do |format|
    #   format.html {}
    #   format.js
    #   format.json { render json: @actors}
    # end
  end



  def show
    @actor = Actor.find(params[:id])
    @movies = @actor.movies.where("total_revenue > ?", 10000000).where("budget > ?", 100) .order("total_revenue DESC")
    @fresh = @actor.movies.where("freshness >= ?", 70).order("freshness DESC")
    @rotten = @actor.movies.where("freshness <= ?", 60).order("freshness ASC")
    # @newest = @actor.movies.where("release_year >= ?", 2010).order("freshness DESC")
    # @oldest = @actor.movies.where("release_year <= ?", 2010).order("freshness ASC")
  end
  
end


