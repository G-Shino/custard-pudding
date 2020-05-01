class CreateShops < ActiveRecord::Migration[5.2]
  def change
    create_table :shops do |t|
      t.string :name
      t.string :kind
      t.string :address
      t.string :holiday
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
