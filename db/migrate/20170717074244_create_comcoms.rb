class CreateComcoms < ActiveRecord::Migration
  def change
    create_table :comcoms do |t|
      t.text :content
      t.integer :post_id
      t.text :email
      t.integer :user_id
      t.timestamps null: false
    end
  end
end
