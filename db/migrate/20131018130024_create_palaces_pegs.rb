class CreatePalacesPegs < ActiveRecord::Migration
  def change
    create_table :palaces_pegs do |t|
      t.integer :palace_id
      t.integer :peg_id

      t.timestamps
    end
  end
end
