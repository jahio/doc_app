class GamesController < ApplicationController

  def index
    render json: { video_games: VideoGame.all }
  end

  def create
    g = VideoGame.new(video_game_params)
    if g.valid? && g.save
      render json: { video_game: g }
    else
      render json: { errors: g.errors }
    end
  end

private

  def video_game_params
    params.require(:video_game).permit(:title, :release_date, :url)
  end

end
