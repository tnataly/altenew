class AddColumnsToTemplate < ActiveRecord::Migration
  def change
    add_column :templates, :size, :string
    add_column :templates, :front_image, :string
    add_column :templates, :back_image, :string
  end
end
