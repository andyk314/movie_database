# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



movies = []
# Enter Actor ID to grab information
data = HTTParty.get "https://api.themoviedb.org/3/person/?api_key=631d0d27d8bd582b2876ac8036e7641b"
actor = Actor.create(name: data['name'], star_id: data['id'], birthdate: data['birthday'], picture: data['profile_path'])

# Add actor json file to parse information
response = JSON.parse(File.read('db/sigourney.json'))

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
  # Associate this movie to Tom
  actor.movies << movie
  actor.save
end






# movies = []
# actor = Actor.create(name: "")
# response = HTTParty.get 'https://api.themoviedb.org/3/person/3125/credits?api_key=631d0d27d8bd582b2876ac8036e7641b'

# for i in 0...response["cast"].count
#   movie = Movie.find_or_initialize_by(movie_id: (response["cast"][i]["id"]).to_s)
#   if movie.new_record?
#     movie.title = response["cast"][i]["title"]
#     movies << movie
#     movie.save
#   end
#   # Associate this movie to Tom
#   actor.movies << movie
#   actor.save
# end

# movies.each do |m|
# #  mooov = Movie.find_by(movie_id: "13")
#   data = JSON.parse(File.read('db/brad_pitt.json'))
#   # data = HTTParty.get "https://api.themoviedb.org/3/movie/#{m.movie_id}?api_key=631d0d27d8bd582b2876ac8036e7641b"
#   # moov.revenue = data[i]["revenue"]
#   # moov.save
#   # binding.pry
#   m.revenue = data["revenue"]
#   m.release_date = data["release_date"]
#   m.poster = data["poster_path"]
#   m.runtime = data["runtime"]
#   m.save
# end











