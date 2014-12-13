class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :title
      t.text :description
      t.text :image_url
      t.text :url
      t.integer :user_id
      t.boolean :is_private, default: false

      t.timestamps
    end
  end
end
