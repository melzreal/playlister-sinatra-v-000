class ArtistsController < ApplicationController

  get '/artists' do
    @artist = Artist.all
    erb :'/artists/index'
  end

  get '/artist/:id' do
    @artist = Artist.find(params[:id])
    erb :'/artists/show'
  end


end
