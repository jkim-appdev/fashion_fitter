class CreateTops < ActiveRecord::Migration[6.0]
  def change
    create_table :tops do |t|
      t.integer :user_id
      t.float :price
      t.string :image
      t.string :brand
      t.integer :outfits_count

      t.timestamps
    end
  end
end
