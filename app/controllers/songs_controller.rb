class SongsController < ApplicationController

  get '/songs' do
     @songs = Song.all
     erb :'/songs/index'
   end

   get '/songs/new' do
     erb :'/songs/new'
   end

   post '/songs' do
     @msong = Song.create(:name => params["Name"])
     @msong.artist = Artist.find_or_create_by(:name => params["Artist Name"])
     params[:genre].each do |genre|
       @msong.genres << Genre.find(genre)
     end
    @msong.save
    flash[:message] = "Successfully created song."
    redirect "/songs/#{@msong.slug}"

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
     @song.update(params[:song])
     @song.artist = Artist.find_or_create_by(name: params[:artist][:name])
     @song.genre_ids = params[:genres]
     @song.save

     flash[:message] = "Successfully updated song."

     redirect "songs/#{@song.slug}"
   end



end
