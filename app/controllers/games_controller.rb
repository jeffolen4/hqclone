class GamesController < ApplicationController

  def index
    Rails.logger.info("\n\n\nIn games index method\n\n\n")
    @games = Game.games_in_progress
    @game_pending = Game.pending_game
  end

  def join
    @game = Game.pending_game
  end

  def waiting_room
  end

end
