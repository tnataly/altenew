class CreatePersonalizes < ActiveRecord::Migration
  def change
    create_table :personalizes do |t|
      t.text :text_personalize
      t.integer :user_id
      t.integer :template_id

      t.timestamps
    end
  end
end
