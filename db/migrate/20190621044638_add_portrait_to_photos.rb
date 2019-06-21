class AddPortraitToPhotos < ActiveRecord::Migration[5.2]
  def change
    add_column :photos, :portrait, :boolean
  end
end
