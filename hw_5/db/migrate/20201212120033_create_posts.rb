class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :name
      t.string :title
      t.text :content
      t.string :image

      t.timestamps
    end
    add_index :posts, [:author_id, :created_at]
  end
end
