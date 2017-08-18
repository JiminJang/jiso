class CreateAlbacoms < ActiveRecord::Migration
  def change
    create_table :albacoms do |t|
      t.text :content
      t.integer :post_id
      t.text :email
      t.integer :user_id
      t.timestamps null: false
    end
  end
end
