class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :name
      t.integer :page
      t.datetime :publish_date
      t.references :category, foreign_key: true
      t.references :publisher, foreign_key: true
      t.references :author, foreign_key: true

      t.timestamps
    end
  end
end
