class GenresController < ApplicationController

  get '/genres' do
    @genres = Genre.all
    erb :'/genres/index'
  end

  get '/genres/:id' do
    @genre = Genre.find_by_id(params[:id])
    erb :'/genre/show'
  end


end
