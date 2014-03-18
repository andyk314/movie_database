json.actor do |json|
  #json.extract!  @actor, :name
  json.movies @movies, :title, :total_revenue, :usa_revenue, :international_revenue, :budget, :release_year, :runtime
end