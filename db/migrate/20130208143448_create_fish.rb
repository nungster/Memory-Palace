class CreateFish < ActiveRecord::Migration
  def change
    create_table :fish do |t|
      t.string :name
      t.text :desc

      t.timestamps
    end
  end
end
