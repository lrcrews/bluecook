class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :description
      t.text :content
      t.string :title
      t.timestamps null: false
    end

    # Foreign keys
    add_belongs_to :posts, :category, index: true
  end
end
