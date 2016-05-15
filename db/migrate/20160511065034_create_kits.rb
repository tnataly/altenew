class CreateKits < ActiveRecord::Migration
  def change
    create_table :kits do |t|
      t.string :title
      t.string :cover_image
      t.string :slug

      t.timestamps
    end

    add_index :kits, :slug, unique: true
  end
end
