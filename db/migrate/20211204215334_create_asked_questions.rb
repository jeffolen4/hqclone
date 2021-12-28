class CreateAskedQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :asked_questions, id: false do |t|
      t.bigint      :id, primary_key: true, auto_increment: true, unsigned: true
      t.references  :game
      t.references  :question

      t.timestamps
    end
  end
end
