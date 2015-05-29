class CreateSlackPosts < ActiveRecord::Migration
  def change
    create_table :slack_posts do |t|
      t.string :name
      t.text :location

      t.timestamps null: false
    end
  end
end
