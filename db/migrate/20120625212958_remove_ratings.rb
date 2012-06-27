class RemoveRatings < ActiveRecord::Migration
  def up
    drop_table :ratings
  end

  def down
    create_table :ratings do |t|
      t.integer :product_id
      t.decimal :value
      t.integer :count
      t.timestamps
    end
  end
end
