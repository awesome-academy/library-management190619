class CreateFollowings < ActiveRecord::Migration[5.2]
  def change
    create_table :followings do |t|
      t.references :user, foreign_key: true
      t.references :author, foreign_key: true, null: true
      t.references :book, foreign_key: true, null: true

      t.timestamps
    end
  end
end
