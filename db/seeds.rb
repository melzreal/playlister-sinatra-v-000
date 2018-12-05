# Add seed data here. Seed your database with `rake db:seed`

rayanna = Artist.create(name: "Rayanna")
song_uno = Song.create(name: "Chimichangas", artist: rayanna)
gen_uno = Genre.create(name: "Mexican")

Song.create(name: "Burritos", artist: rayanna, genre: gen_uno)
