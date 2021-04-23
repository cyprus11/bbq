class ChangeColumnPhotoInPhotos < ActiveRecord::Migration[6.0]
  def change
    change_column_null(:photos, :photo, false)
  end
end
