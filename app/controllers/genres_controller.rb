class GenresController < ApplicationController

  get '/genres' do
    @genres = Genre.all
    erb :'/genres/index'
  end

  get '/genres/:id' do
    @genre = Genre.find(params[:id])
    erb :'/genre/show'
  end


end
