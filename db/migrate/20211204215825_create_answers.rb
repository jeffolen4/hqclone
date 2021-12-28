class CreateAnswers < ActiveRecord::Migration[6.1]
  def change
    create_table :answers, id: false do |t|
      t.bigint     :id, primary_key: true, auto_increment: true, unsigned: true
      t.references :question
      t.string     :answer_verbiage
      t.boolean    :correct_answer

      t.timestamps
    end
  end
end
