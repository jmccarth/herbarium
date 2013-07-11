class AddViewCountToHerbs < ActiveRecord::Migration
  def up
    add_column :herbs, :view_count, :integer, default: 0
  end
  
  def down
    remove_column :herbs, :view_count
  end
end
