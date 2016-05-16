class CreateBacks < ActiveRecord::Migration
  def change
    create_table :backs do |t|
      t.string :image
      t.integer :template_id

      t.timestamps
    end
  end
end
