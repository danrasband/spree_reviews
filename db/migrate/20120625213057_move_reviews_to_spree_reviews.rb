class MoveReviewsToSpreeReviews < ActiveRecord::Migration
  def change
    rename_table :reviews, :spree_reviews
  end
end
