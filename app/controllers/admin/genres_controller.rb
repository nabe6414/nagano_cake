class Admin::GenresController < ApplicationController
  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      redirect_to admin_genres_path
      flash[:new_genre] = "新しいジャンル名が追加されました"
    else
      @genres = Genre.all
      render :index
    end
  end

  def index
    @genre = Genre.new
    @genres = Genre.all
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
     @genre = Genre.find(params[:id])
     if @genre.update(genre_params)
      flash[:update_genre] = "ジャンル名が更新されました"
      redirect_to admin_genres_path
    else
      render :edit
    end
  end

  private

  def genre_params
    params.require(:genre).permit(:name)
  end
end
