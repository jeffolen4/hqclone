class Player < ApplicationRecord

  validates_uniqueness_of :player_email
  validates_uniqueness_of :player_game_name
  #has_one :active_game, class_name: "Game", foreign_key: "id"
  validates_presence_of :player_email
  validates_presence_of :player_game_name

  ADJECTIVES = ["Aloof", "Beautiful", "Courageous", "Dangerous", "Emotional", "Famous", "Gilded"]
  NOUNS      = ["Hammer", "Iceman", "Jewel", "Knife", "Llama", "Magnet"]

  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }, on: :create

  def self.create_name
    return "#{ADJECTIVES.sample}#{NOUNS.sample}#{rand.to_s[2..4]}"
  end

  def self.generate_name
    chk_name = self.create_name
    until self.non_existent_name(chk_name) do
      puts "#{chk_name = self.create_name}"
    end
    return chk_name
  end

  def self.non_existent_name(player_game_name)
    player = Player.where(player_game_name: player_game_name)
    return player.empty?
  end

  def add_to_game(game)
    self.update({active_game: game.id})
  end

  def authenticate(password)

  end

end
