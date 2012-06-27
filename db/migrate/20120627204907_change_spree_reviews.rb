class ChangeSpreeReviews < ActiveRecord::Migration
  def up
    change_table :spree_reviews do |t|
      t.remove :title
      t.references :user
    end
    change_column :spree_reviews, :rating, :decimal
  end

  def down
    change_table :spree_reviews do |t|
      t.text :title
      t.remove :user_id
    end
    change_column :spree_reviews, :rating, :integer
  end
end
