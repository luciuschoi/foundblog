class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.references :user, index: true
      t.string :name, null: false

      t.timestamps
    end
  end
end