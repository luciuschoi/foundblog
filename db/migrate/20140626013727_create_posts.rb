class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.references :category, index: true
      t.references :user, index: true
      t.string :title, null: false
      t.text :content, null: false
      t.boolean :published, default: false

      t.timestamps
    end
  end
end