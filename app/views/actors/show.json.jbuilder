json.actor do |json|
  json.extract!  @actor, :id, :name



json.movies @movies, :title, :revenue
end