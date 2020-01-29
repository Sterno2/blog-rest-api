class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :author
      t.integer :likes
      t.integer :reads
      t.string :tags, array: true, :default => []
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
