class AddFolderToHerbs < ActiveRecord::Migration
  def change
    add_column :herbs, :folder, :integer

  end
end
