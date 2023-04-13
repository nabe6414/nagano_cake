class Public::GenresController < ApplicationController
  def show
    @genre = Genre.find_by(name: params[:name])
    @genres = Genre.all
  end
end
