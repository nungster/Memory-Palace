class CreatePegs < ActiveRecord::Migration
  def change
    create_table :pegs do |t|
      t.integer :user_id
      t.integer :palace_id

      t.integer :fp_id
      t.string :code
      t.string :place
      t.string :action
      t.string :title
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :link
      t.string :note

      t.timestamps
    end
    add_index :palace_id, :user_id
  end
end
