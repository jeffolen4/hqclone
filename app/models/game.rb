class Game < ApplicationRecord

  has_many :asked_questions
  has_many :players

  GAME_STATES = ["Pending","In-Progress","Complete"]

  PENDING     = 0
  IN_PROGRESS = 1
  COMPLETED   = 2

  def get_current_state
    return GAME_STATES[self.current_state]
  end

  def self.games_in_progress
    self.where(current_state: IN_PROGRESS)
  end

  def self.pending_game
    existing_pending = self.find_by_current_state(PENDING)
    return existing_pending if existing_pending.present?

    return self.create(current_state: PENDING)
  end

  def pending_game_start_time
    game = Game.pending_game
    seconds_elapsed = DateTime.now().to_i - game.created_at.to_i
    return (seconds_elapsed > APP_CONFIG["minimum_delay_time"]) ? 0 : APP_CONFIG["minimum_delay_time"]-seconds_elapsed
  end

  def add_player(player)

  end

end
