class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.references :user, foreign_key: true
      t.references :shop, foreign_key: true
      t.string :name
      t.integer :hardness
      t.integer :richness
      t.integer :caramel
      t.string :comment

      t.timestamps
    end
  end
end
