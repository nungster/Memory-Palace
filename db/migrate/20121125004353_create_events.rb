class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.float :latitude
      t.float :longitude
      t.float :airTemp
      t.integer :amount
      t.float :length

      t.timestamps
    end
  end
end
