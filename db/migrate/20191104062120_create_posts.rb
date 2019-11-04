class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :data_code
      t.string :data_type
      t.string :title
      t.text :content
      t.text :picture_url

      t.timestamps
    end
  end
end
