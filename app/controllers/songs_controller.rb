class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/:id' do
    @songs = Song.find(params[:id])
    erb :'/songs/show'
  end


end
