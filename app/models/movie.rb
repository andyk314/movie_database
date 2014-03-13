class Movie < ActiveRecord::Base
  has_many :actor_movie
  has_many :actors, through: :actor_movie
end
