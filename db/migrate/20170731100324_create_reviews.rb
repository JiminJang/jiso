class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :title, null: false
      t.text :content, null: false
      t.string :image
      t.text :email
      t.integer :user_id
      t.integer :star #사용자가 선택한 별점 
      t.integer :upcount,    default: 0 #다른 사용자들이 좋아요 누른거

      t.timestamps null: false
    end
  end
end
