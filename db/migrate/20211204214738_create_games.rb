class CreateGames < ActiveRecord::Migration[6.1]
  def change
    create_table :games, id: false do |t|
      t.bigint  :id, primary_key: true, auto_increment: true, unsigned: true
      t.integer  :players_all, unsigned: true
      t.integer  :players_left, unsigned: true
      t.bigint  :questions_asked, unsigned: true
      t.integer :current_state

      t.timestamps
    end
  end
end
