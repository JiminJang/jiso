class CreateCompliments < ActiveRecord::Migration
  def change
    create_table :compliments do |t|
      t.string :title, null: false
      t.text :content, null: false
      t.text :email
      t.integer :user_id
      t.timestamps null: false
    end
  end
end
