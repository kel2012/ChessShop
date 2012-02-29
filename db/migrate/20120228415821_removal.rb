class Removal < ActiveRecord::Migration
  def up
    remove_column(:products, :photo_file_name)
    remove_column(:products, :photo_content_type)
    remove_column(:products, :photo_file_size)
    remove_column(:products, :photo_updated_at)
  end

  def down
  end
end
