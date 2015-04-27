class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.string :post
      t.string :user

      t.timestamps null: false
    end
  end
end
