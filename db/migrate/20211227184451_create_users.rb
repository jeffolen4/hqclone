class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users, id: :unsigned_integer do |t|
      t.string :email
      t.string :password_digest

      t.timestamps
    end
  end
end
