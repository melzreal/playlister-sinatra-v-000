class SongsController < ApplicationController

  get '/songs' do
     @songs = Song.all
     erb :'/songs/index'
   end

   post '/songs' do
     msong = Song.new(name: params[:Name])

    if Artist.find_by(name: params["Artist Name"])
      msong.artist = Artist.find_by(name: params["Artist Name"])
    else
      msong.artist = Artist.create(name: params["Artist Name"])
    end

    params[:genres].each do |genre|
      msong.genres << Genre.find(genre)
    end
    msong.save

    redirect "/songs/#{msong.slug}"

   end

   get '/songs/new' do
     erb :'/songs/new'
   end

   get '/songs/:slug' do
     @song = Song.find_by_slug(params[:slug])
     @artist = @song.artist.name
     erb :'/songs/show'
   end

   get '/songs/:slug/edit' do
     @song = Song.find_by_id(params[:id])
     erb :'/songs/edit'
   end


   patch '/songs/:slug' do
     @song = Song.find_by_slug(params[:slug])

     @song.update(params["Name"])

     if !params["Artist Name"].empty?
       @song.artist = artist.create(name: params["Artist Name"])
     end
     @song.save
     redirect "songs/#{@song.slug}"
   end



end
