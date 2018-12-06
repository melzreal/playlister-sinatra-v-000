class ArtistsController < ApplicationController

  get '/artists' do
    @artists = Artist.all
    erb :'/artists/index'
  end

  get '/artist/:id' do
    @artist = Artist.find(params[:id])
    erb :'/artists/show'
  end


end
