# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


list = [
 {"id"=>287,"name"=>"Brad Pitt"},
 {"id"=>72129,"name"=>"Jennifer Lawrence"},
 {"id"=>2231,"name"=>"Samuel L. Jackson"},
 {"id"=>56731,"name"=>"Jessica Alba"},
 {"id"=>10959,"name"=>"Shia LaBeouf"},
 {"id"=>18277,"name"=>"Sandra Bullock"},
 {"id"=>1461,"name"=>"George Clooney"},
 {"id"=>6193,"name"=>"Leonardo DiCaprio"},
 {"id"=>10297,"name"=>"Matthew McConaughey"},
 {"id"=>3223,"name"=>"Robert Downey Jr."},
 {"id"=>31,"name"=>"Tom Hanks"},
 {"id"=>3125,"name"=>"Madonna"},
 {"id"=>1892,"name"=>"Matt Damon"},
 {"id"=>204,"name"=>"Kate Winslet"},  
 {"id"=>6968,"name"=>"Huge Jackman"},  
 {"id"=>38673,"name"=>"Channing Tatum"}, 
 {"id"=>13240,"name"=>"Mark Wahlberg"}, 
 {"id"=>18918,"name"=>"Dwayne Johnson"}, 
]

movies = []
actor = Actor.create(list[11])
response = HTTParty.get 'https://api.themoviedb.org/3/person/3125/credits?api_key=631d0d27d8bd582b2876ac8036e7641b'

for i in 0...response["cast"].count
  movie = Movie.find_or_initialize_by(movie_id: (response["cast"][i]["id"]).to_s)
  if movie.new_record?
    movie.title = response["cast"][i]["title"]
    movies << movie
    movie.save
  end
  # Associate this movie to Tom
  actor.movies << movie
  actor.save
end

movies.each do |m|
#  mooov = Movie.find_by(movie_id: "13")
  data = HTTParty.get "https://api.themoviedb.org/3/movie/#{m.movie_id}?api_key=631d0d27d8bd582b2876ac8036e7641b"
  # moov.revenue = data[i]["revenue"]
  # moov.save
  # binding.pry
  m.revenue = data["revenue"]
  m.release_date = data["release_date"]
  m.poster = data["poster_path"]
  m.runtime = data["runtime"]
  m.save
end











