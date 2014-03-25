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
data = HTTParty.get "https://api.themoviedb.org/3/person/4491?api_key=631d0d27d8bd582b2876ac8036e7641b"
actor = Actor.create(name: data['name'], star_id: data['id'], birthdate: data['birthday'], picture: data['profile_path'], bio: data['biography'], dvd: data['$_domestic_DVD_sales'], budget: data['movie_financial_summary_production_budget'], quote: "The 'I Hate Rachel Green Club'? Who was in this club?" )

response = JSON.parse(File.read('db/aniston.json'))

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


a = Movie.find_by(title: "Flirting")
a.freshness = 96
a.save
puts "b"

c = Movie.find_by(title: "God Grew Tired Of Us")
c.freshness = 91
c.save
puts "c"

d = Movie.find_by(title: "To Die For")
d.freshness = 87
d.save
puts "d"

e = Movie.find_by(title: "The Invasion")
e.freshness = 20
e.save
puts "e"

f = Movie.find_by(title: "Just Go With It")
f.freshness = 19
g.save
puts "g"

g = Movie.find_by(title: "Trespass")
g.freshness = 10
f.save
puts "f"
