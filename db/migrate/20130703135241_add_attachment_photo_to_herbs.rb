class AddAttachmentPhotoToHerbs < ActiveRecord::Migration
  def self.up
    change_table :herbs do |t|
      t.attachment :photo
    end
  end

  def self.down
    drop_attached_file :herbs, :photo
  end
end
