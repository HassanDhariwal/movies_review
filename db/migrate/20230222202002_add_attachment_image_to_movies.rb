class AddAttachmentImageToMovies < ActiveRecord::Migration[7.0]
  def self.up
    add_attachment :movies, :image
  end

  def self.down
    remove_attachment :movies, :image
  end
end
