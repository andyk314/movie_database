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
data = HTTParty.get "https://api.themoviedb.org/3/person/6941?api_key=631d0d27d8bd582b2876ac8036e7641b"
actor = Actor.create(name: data['name'], star_id: data['id'], birthdate: data['birthday'], picture: data['profile_path'], bio: data['biography'], dvd: data['$_domestic_DVD_sales'], budget: data['movie_financial_summary_production_budget'], quote: "You know, I don't think they have enough meats on sticks. No seriously, if you think about it, they have plenty of sweets, right? They have lollipops. They have fudgcicles. They have popcicles. But they don't have any other meat on sticks." )

response = JSON.parse(File.read('db/cameron.json'))

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


b = Movie.find_by(title: "Shrek")
b.freshness = 88
b.save
puts "b"

c = Movie.find_by(title: "Shrek 2")
c.freshness = 89
c.save
puts "c"

d = Movie.find_by(title: "Being John Malkovich")
d.freshness = 93
d.save
puts "d"

e = Movie.find_by(title: "What to Expect When You're Expecting")
e.freshness = 22
e.save
puts "e"

g = Movie.find_by(title: "The Sweetest Thing")
g.freshness = 26
g.save
puts "g"

f = Movie.find_by(title: "What Happens in Vegas")
f.freshness = 27
f.save
puts "f"
