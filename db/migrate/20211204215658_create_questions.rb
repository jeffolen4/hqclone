class CreateQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :questions, id: false do |t|
      t.bigint :id, primary_key: true, auto_increment: true, unsigned: true
      t.string :question_verbiage

      t.timestamps
    end
  end
end
