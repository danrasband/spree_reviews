class MoveRatingsToSpreeRatings < ActiveRecord::Migration
  def change
    rename_table :ratings, :spree_ratings
  end
end
