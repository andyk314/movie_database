json.actor do |json|
  #json.extract!  @actor, :name
  json.movies @movies, :title, :revenue, :poster, :runtime, :release_date
end

