class AddAttachmentImage2ToItems < ActiveRecord::Migration
  def self.up
    change_table :items do |t|
      t.attachment :image2
    end
  end

  def self.down
    remove_attachment :items, :image2
  end
end
