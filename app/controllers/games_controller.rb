class GamesController < ApplicationController
  def show
    @game_id = params[:id]
  end
end
