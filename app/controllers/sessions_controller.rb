class SessionsController < ApplicationController
  def new
  end

  def create
    @player_params = player_params
    @player = Player.find_by(player_email: @player_params["player_email"])
    Rails.logger.info("player_params: #{@player_params.inspect}")
    puts "player: #{@player.inspect}"
    if @player && @player.authenticate_password(@player_params["password"])
      session[:player_id] = @player.id
      redirect_to game_join_path
    else
      helpers.flash_message("error", "Email and/or Password is invalid.")
      redirect_to games_path
    end
  end

  def destroy
  end

  private

  def player_params
    params.require(:player).permit(:player_email, :password, :password_confirmation, :player_game_name)
  end

end
