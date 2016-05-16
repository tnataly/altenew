class CreateFronts < ActiveRecord::Migration
  def change
    create_table :fronts do |t|
      t.string :image
      t.integer :template_id

      t.timestamps
    end
  end
end
