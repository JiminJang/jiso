class CreateReviewcoms < ActiveRecord::Migration
  def change
    create_table :reviewcoms do |t|
      t.text :content
      t.integer :post_id
      t.integer :user_id
      t.text :email

      t.timestamps null: false
    end
  end
end
