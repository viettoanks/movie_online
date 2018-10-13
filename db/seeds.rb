require "ffaker"

5.times do |n|
  category = Category.create! title:"Category #{n+1}",
                              description: FFaker::Lorem.paragraph
  10.times do |m|
    movie = category.movies.create! name:"Movie ##{m+1}",
                            alternative_name: "Phim ##{m+1}",
                            poster: "anh1.jpg",
                            trailer: %q("<iframe width="1351"
                              height="480" src="https://www.youtube.com/embed/6mQDS7Q7pys"
                              frameborder="0" allow="autoplay; encrypted-media"
                              allowfullscreen></iframe>"),
                            publish_date: 1.month.ago,
                            description: FFaker::Lorem.paragraph,
                            country: FFaker::Address.country,
                            view_count: rand(1000)
    5.times do |e|
      movie.episodes.create! name: "Episode #{e+1}",
                             order: e+1,
                             link: "https://r4---sn-npoeenez.googlevideo.com/videoplayback?id=9cc5f00a7b091f95&itag=18&source=webdrive&&requiressl=yes&mm=30&mn=sn-npoeenez&ms=nxu&mv=m&pl=63&sc=yes&ei=hWPAW6T_LcGq1AbvjovIAw&susc=drp&app=fife&driveid=1C9VbeXnrzeVIghGqGliUDaa2LMbBun4d&mime=video/mp4&dur=5953.387&lmt=1539000505392093&mt=1539334958&ip=2400:6180:0:d1::5d8:6001&ipbits=0&expire=1539342245&sparams=ip,ipbits,expire,id,itag,source,requiressl,mm,mn,ms,mv,pl,sc,ei,susc,app,driveid,mime,dur,lmt&signature=923E05DDA3435A412177632D532926DD0F97C2EE25AC32DD1D2F110D6591B94E.D5B60F5FA4D692145E48FCF9E4290449DC20CF1B4B91C3130841D0462968EBEB&key=us0"
    end
  end
end

10.times do |n|
  p = Person.create! name: FFaker::Name.name,
                 gender: [true, false].sample,
                 birthday: 25.year.ago - n.days,
                 country: FFaker::Address.country,
                 description: FFaker::Lorem.paragraph
  3.times do |m|
    MoviesPerson.create! person: p, movie: Movie.all.sample, role: true
  end
  3.times do |m|
    MoviesPerson.create! person: p, movie: Movie.all.sample, role: false
  end
end
