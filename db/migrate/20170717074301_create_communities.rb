class CreateCommunities < ActiveRecord::Migration
  def change
    create_table :communities do |t|
      t.string :title, null: false
      t.text :content, null: false
      t.string :image
      t.text :email
      t.integer :user_id
      t.integer :upcount,    default: 0
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              

      t.timestamps null: false
    end
  end
end
