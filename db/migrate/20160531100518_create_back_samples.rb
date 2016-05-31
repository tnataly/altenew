class CreateBackSamples < ActiveRecord::Migration
  def change
    create_table :back_samples do |t|
      t.string :image
      t.integer :template_id

      t.timestamps
    end
  end
end
