# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Actor.destroy_all
# Movie.destroy_all
movies = []
# Enter Actor ID to get grab all information
data = HTTParty.get "https://api.themoviedb.org/3/person/500?api_key=631d0d27d8bd582b2876ac8036e7641b"
actor = Actor.create(name: data['name'], star_id: data['id'], birthdate: data['birthday'], picture: data['profile_path'], bio: data['biography'], dvd: data['$_domestic_DVD_sales'], budget: data['movie_financial_summary_production_budget'], quote: "In this life, it's not what you hope for, it's not what you deserve- it's what you take!" )

response = JSON.parse(File.read('db/tom.json'))

for i in 0...response.count
  movie = Movie.find_or_initialize_by(title: (response[i]["movie_display_name"]))
  if movie.new_record?
    movie.title = response[i]["movie_display_name"]
    movie.total_revenue = response[i]["$_total_box_office"]
    movie.usa_revenue = response[i]["movie_financial_summary_domestic_box_office"]
    movie.international_revenue = response[i]["movie_financial_summary_international_box_office"]
    movie.budget = response[i]["movie_financial_summary_production_budget"]
    movie.release_year = response[i]["movie_production_year"]
    movies << movie
    movie.save
  end
  # Associate this movie to the current actor/actresses
  actor.movies << movie
  actor.save
end


b = Movie.find_by(title: "Risky Business")
b.freshness = 98
b.save
puts "b"

c = Movie.find_by(title: "Mission: Impossible - Ghost Protocol")
c.freshness = 93
c.save
puts "c"

d = Movie.find_by(title: "The Color of Money")
d.freshness = 92
d.save
puts "d"

e = Movie.find_by(title: "Endless Love")
e.freshness = 25
e.save
puts "e"

g = Movie.find_by(title: "Losin' It")
g.freshness = 22
g.save
puts "g"

f = Movie.find_by(title: "Cocktail")
f.freshness = 5
f.save
puts "f"
