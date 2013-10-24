class CreateFamousPeople < ActiveRecord::Migration
  def up
    create_table :famous_people do |t|
      t.string :code
      t.string :title
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :link
      t.string :note
    end


  end

  def down
  end
end