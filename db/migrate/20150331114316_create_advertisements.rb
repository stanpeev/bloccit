class CreateAdvertisements < ActiveRecord::Migration
  def change
    create_table :advertisements do |t|
      t.string :title
      t.text :body
      t.text :copy
      t.integer :price
      t.integer :post_id
      t.integer :comment_id
      t.timestamps null: false
    end
  end
end
