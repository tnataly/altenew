class AddKitIdToTemplate < ActiveRecord::Migration
  def change
    add_column :templates, :kit_id, :integer
  end
end
