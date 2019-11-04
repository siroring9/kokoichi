class AddColumnOnPost < ActiveRecord::Migration[6.0]
  def up
	add_column :posts, :content_url, :text
  end

  def down
	remove_column :posts, :content_url
  end
end
