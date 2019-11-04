json.extract! post, :id, :data_code, :data_type, :title, :content, :picture_url, :created_at, :updated_at
json.url post_url(post, format: :json)
