class CreateSamples < ActiveRecord::Migration
  def change
    create_table :samples do |t|
      t.string :image
      t.integer :template_id

      t.timestamps
    end
  end
end
