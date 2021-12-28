module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_player

    def connect
      self.current_player = find_verified_player
    end

    private
      def find_verified_player
        return nil unless session[:player_id]
        if verified_player = Player.find_by(id: session[:player_id])
          return verified_player
        else
          return nil
        end
      end

  end
end
