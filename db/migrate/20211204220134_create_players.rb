class CreatePlayers < ActiveRecord::Migration[6.1]
  def change
    create_table :players, id: false do |t|
      t.bigint :id, primary_key: true, auto_increment: true, unsigned: true
      t.string :player_game_name
      t.string :player_email
      t.string :password_digest
      t.bigint :active_game

      t.timestamps
    end
  end
end
