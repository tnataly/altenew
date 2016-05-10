class EditColumnToTemplate < ActiveRecord::Migration
  def change
    rename_column :templates, :name, :title
    rename_column :templates, :image, :cover_image
    remove_column :templates, :front_image
    remove_column :templates, :back_image
  end
end
