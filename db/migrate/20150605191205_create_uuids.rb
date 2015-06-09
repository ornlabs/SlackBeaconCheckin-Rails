class CreateUuids < ActiveRecord::Migration
  def change
    create_table :uuids do |t|
      t.text :uuid
      t.text :location

      t.timestamps null: false
    end
  end
end
