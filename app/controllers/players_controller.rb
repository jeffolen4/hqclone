class PlayersController < ApplicationController

  def index
  end

  def show
  end

  def new
  end

  def create
    @player = Player.new(player_params)
    Rails.logger.info("player_params: #{player_params.inspect}")
    @player.player_game_name = player_params[:player_game_name].empty? ? Player.generate_name : player_params[:player_game_name]
    unless @player.save
      @player.errors.each do |err|
        helpers.flash_message("error", "#{err.attribute} #{err.message}")
      end
      redirect_to new_player_path
    else
      helpers.flash_message("success", "Username <b>#{@player.player_game_name}</b> created for email address <b>#{@player.player_email}</b>.")
      # @game = Game.pending_game
      # @player.add_to_game(@game)
      redirect_to game_join_path
    end
  end

  private

  def player_params
    params.require(:player).permit(:player_email, :player_game_name, :password, :password_confirmation)
  end

end
