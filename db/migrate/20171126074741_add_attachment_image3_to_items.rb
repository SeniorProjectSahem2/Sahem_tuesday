class AddAttachmentImage3ToItems < ActiveRecord::Migration
  def self.up
    change_table :items do |t|
      t.attachment :image3
    end
  end

  def self.down
    remove_attachment :items, :image3
  end
end
