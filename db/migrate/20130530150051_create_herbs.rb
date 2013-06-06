class CreateHerbs < ActiveRecord::Migration
  def change
    create_table :herbs do |t|
      t.string :family
      t.string :genus
      t.string :species
      t.string :author
      t.string :name
      t.string :comments

      t.timestamps
    end
  end
end
