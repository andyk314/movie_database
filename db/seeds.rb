# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Actor.destroy_all
Movie.destroy_all


actors = [ 
  { "id"=>287, "name"=> "Brad Pitt", "json"=>"brad_pitt.json", "quote"=>"Welcome to Fight Club. The first rule of Fight Club is: you do not talk about Fight Club. The second rule of Fight Club is: you DO NOT talk about Fight Club!" },
  { "id"=>1204, "name"=>"Julia Roberts", "json"=>"julia.json", "quote"=>"After all... I'm just a girl, standing in front of a boy, asking him to love her." },
  { "id"=>1892, "name"=>"Matt Damon", "json"=>"matt.json", "quote"=>"Listen, here's the thing. If you can't spot the sucker in the first half hour at the table, then you ARE the sucker." },
  { "id"=>4491, "name"=>"Jennifer Aniston", "json"=>"aniston.json", "quote"=>"You know what, I do want to express myself, okay. And I don't need 37 pieces of flair to do it." },
  { "id"=>18277, "name"=>"Sandra Bullock", "json"=>"sandra.json", "quote"=>"Either I make it down there in one piece and I have one hell of a story to tell...or I burn up in the next ten minutes." },
  { "id"=>72129, "name"=>"Jennifer Lawrence", "json"=>"jennifer.json", "quote"=>"In a world where no one understands, it's good to finally find someone who can."},
  { "id"=>6193, "name"=>"Leonardo DiCaprio", "json"=>"leo.json", "quote"=>"I'm the king of the world!" },
  { "id"=>31, "name"=>"Tom Hanks", "json"=>"tom_hanks.json", "quote"=>"My mama always said life was like a box of chocolates. You never know what you're gonna get." },
  { "id"=>3223, "name"=>"Robert Downey Jr.", "json"=>"robert.json", "quote"=>"Jarvis, sometimes you gotta run before you can walk" },
  { "id"=>2888, "name"=>"Will Smith", "json"=>"will.json", "quote"=>"Anxiety, nightmares and a nervous breakdown, there's only so many traumas a person can withstand until they take to the streets and start screaming." },
  { "id"=>62, "name"=>"Bruce Willis", "json"=>"bruce.json", "quote"=>"The path of the righteous man is beset on all sides by the inequities of the selfish and the tyranny of evil men."},

  { "id"=>6941, "json"=>"cameron.json", "quote"=>"You know, I don't think they have enough meats on sticks. No seriously, if you think about it, they have plenty of sweets, right? They have lollipops. They have fudgcicles. They have popcicles. But they don't have any other meat on sticks." },
  { "id"=>112, "json"=>"cate.json", "quote"=>"Anxiety, nightmares and a nervous breakdown, there's only so many traumas a person can withstand until they take to the streets and start screaming." },
  { "id"=>776, "json"=>"eddie_murphy.json", "quote"=>"That's right, fool! Now I'm a FLYING talking donkey! You might have seen a housefly, maybe even a superfly, but I bet you ain't never seen a DONKEY fly! Ha, ha!" },
  { "id"=>10990, "json"=>"emma.json", "quote"=>"Quote" },
  { "id"=>3, "json"=>"harrison_ford.json", "quote"=>"Quote" },
  { "id"=>85, "json"=>"johnny.json", "quote"=>"This is the day you will always remember as the day you almost caught Captain Jack Sparrow" },
  { "id"=>116, "json"=>"keira.json", "quote"=>"You and I are not the polite people that live in poems. We are blessed and cursed by our times." },
  { "id"=>192, "json"=>"morgan.json", "quote"=>"You measure yourself by the people who measure themselves by you." },
  { "id"=>524, "json"=>"natalie.json", "quote"=>"I'm not saying I don't cry but in between I laugh and I realize how silly it is to take anything too seriously."},
  { "id"=>2227, "json"=>"nicole.json", "quote"=>"Someone has to die in order that the rest of us should value life more." },
  { "id"=>2157, "json"=>"robin.json", "quote"=>"You treat a disease, you win, you lose. You treat a person, I'll guarantee you'll win." },
  { "id"=>2231, "json"=>"samuel.json", "quote"=>"The path of the righteous man is beset on all sides by the inequities of the selfish and the tyranny of evil men." },
  { "id"=>10205, "json"=>"sigourney.json", "quote"=>"Either I make it down there in one piece and I have one hell of a story to tell...or I burn up in the next ten minutes." },
  { "id"=>500, "json"=>"tom.json", "quote"=>"In this life, it's not what you hope for, it's not what you deserve- it's what you take!" },  
  { "id"=>56731, "json"=>"alba.json", "quote"=>"Quote" },
  { "id"=>1461, "json"=>"clooney.json", "quote"=>"You're either in or you're out. Right now."  },
  { "id"=>10297, "json"=>"matthew.json", "quote"=>"Quote" },
  { "id"=>3125, "json"=>"madonna.json", "quote"=>"Quote" },
  { "id"=>204, "json"=>"winslet.json", "quote"=>"Quote" },
  { "id"=>6968, "json"=>"jackman.json", "quote"=>"Quote" },
  { "id"=>38673, "json"=>"channing.json", "quote"=>"Quote" },
  { "id"=>13240, "json"=>"wahlberg.json", "quote"=>"Quote" },
  { "id"=>18918, "json"=>"dwayne.json", "quote"=>"Quote" },
  { "id"=>, "json"=>"ben.json", "quote"=>"I need your help. I can't tell you what it is, you can never ask me about it later, and we're gonna hurt some people."  },
  { "id"=>, "json"=>"vince.json", "quote"=> },
  { "id"=>, "json"=>"travolta.json", "quote"=> "Misdirection. What the eyes see and the ears hear, the mind believes." },
  { "id"=>, "json"=>"stiller.json", "quote"=> "I'm pretty sure there's a lot more to life than being really, really, ridiculously good looking. And I plan on finding out what that is." 
},
  { "id"=>, "json"=>"streep.json", "quote"=> "That is what we do. That is what people do. They stay alive for each other." },
  { "id"=>, "json"=>"sandler.json", "quote"=> "It's hard to soar with the eagles when you're surrounded by turkeys." 
},
  { "id"=>, "json"=>"jolie.json", "quote"=>"Happy endings are just stories that haven't finished yet." },
  { "id"=>, "json"=>"barrymore.json", "quote"=>"At what point do you say to yourself, I'm counting on you to be the one, and I have no fall back plan?"  },
  { "id"=>, "json"=>"cage.json", "quote"=>"He may have my soul, but he doesn't have my spirit."  },
  { "id"=>, "json"=>"carrey.json", "quote"=>"All righty then."  }
]


# Actor.destroy_all
# Movie.destroy_all

movies = []
# Enter Actor ID to get grab all information

actors.each do |act|
  string = "https://api.themoviedb.org/3/person/" + act['id'].to_s +  "?api_key=631d0d27d8bd582b2876ac8036e7641b"
  data = HTTParty.get string
  actor = Actor.create(name: data['name'], star_id: data['id'], birthdate: data['birthday'], picture: data['profile_path'], bio: data['biography'], dvd: data['$_domestic_DVD_sales'], budget: data['movie_financial_summary_production_budget'], quote: "You and I are not the polite people that live in poems. We are blessed and cursed by our times." )
  json_file = 'db/' + act['json'].to_s
  # binding.pry
  response = JSON.parse(File.read(json_file))

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
end

