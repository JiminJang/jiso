class CreateBrands < ActiveRecord::Migration
  def change
    create_table :brands do |t|
      t.string :title, null: false
      t.text :content, null: false
      t.string :image
    
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
