class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :name
      t.integer :stars
      t.text :comment
      t.integer :movie_id
      t.string :city
      t.string :state

      t.timestamps null: false
    end
  end
end
