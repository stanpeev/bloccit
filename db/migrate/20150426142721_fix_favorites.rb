class FixFavorites < ActiveRecord::Migration
  def change
    remove_column :favorites, :user
    remove_column :favorites, :post

    add_column :favorites, :user_id, :integer
    add_column :favorites, :post_id, :integer
  end
end
