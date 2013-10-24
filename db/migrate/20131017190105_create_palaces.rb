class CreatePalaces < ActiveRecord::Migration
  def change
    create_table :palaces do |t|
      t.string :title
      t.integer :ptype
      t.integer :user_id

      t.timestamps
    end
  end
end
