class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :titles
      t.text :images
      t.text :receipes
      t.timestamps
    end
  end
end
