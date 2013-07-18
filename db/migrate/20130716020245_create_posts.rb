class CreatePosts < ActiveRecord::Migration
  def change

    create_table :posts do |t|
      t.string      :title
      t.decimal     :price
      t.text        :description
      t.references  :user
      t.references  :post
      t.timestamps
    end
  end
end
