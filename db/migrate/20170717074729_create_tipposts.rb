class CreateTipposts < ActiveRecord::Migration
  def change
    create_table :tipposts do |t|
 t.string :title ,null: false
      t.text :content, null: false
      t.string :image
      t.integer :user_id
      t.text :email
      t.string :category_id

       t.integer :upcount,    default: 0
      t.timestamps null: false
    end
  end
end
