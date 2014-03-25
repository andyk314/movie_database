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
data = HTTParty.get "https://api.themoviedb.org/3/person/2231?api_key=631d0d27d8bd582b2876ac8036e7641b"
actor = Actor.create(name: data['name'], star_id: data['id'], birthdate: data['birthday'], picture: data['profile_path'], bio: data['biography'], dvd: data['$_domestic_DVD_sales'], budget: data['movie_financial_summary_production_budget'], quote: "The path of the righteous man is beset on all sides by the inequities of the selfish and the tyranny of evil men. Blessed is he who in the name of charity and goodwill, shepherds the weak through the valley of the darkness, for he is truly his brother’s keeper, and the finder of lost children. And I will strike down upon thee with great vengeance and furious anger those who attempt to poison and destroy my brothers. And you will know I am the Lord when I lay My vengeance upon thee." )

response = JSON.parse(File.read('db/samuel.json'))

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


a = Movie.find_by(title: "The Player")
a.freshness = 98
a.save

a = Movie.find_by(title: "Pulp Fiction")
a.freshness = 94
a.save

a = Movie.find_by(title: "Moonrise Kingdom")
a.freshness = 94
a.save

a = Movie.find_by(title: "Perfect Stranger")
a.freshness = 11
a.save

a = Movie.find_by(title: "The Cold Light of Day")
a.freshness = 5
a.save

a = Movie.find_by(title: "The Whole Ten Yards")
a.freshness = 4
a.save
