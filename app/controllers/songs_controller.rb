require 'rack-flash'

class SongsController < ApplicationController
  enable :sessions
  use Rack::Flash

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/new' do
    @genres = Genre.all
    erb :'/songs/new'
  end

  post '/songs' do
    artist = Artist.find_or_create_by(params[:artist])
    song = Song.new(params[:song])
    song.artist = artist
    song.save
<<<<<<< HEAD

    flash[:message] = "Successfully created song."
=======
>>>>>>> d42dbc592396bd01c28f64176563f0678112b472
    redirect "/songs/#{song.slug}"
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    @genres = Genre.all
    erb :'/songs/edit'
  end

  patch '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @song.update(params[:song])

    artist = Artist.find_or_create_by(params[:artist])
    @song.artist = artist
    @song.save

    flash[:message] = "Successfully updated song."
    redirect "/songs/#{@song.slug}"
  end

end
