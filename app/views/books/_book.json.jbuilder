json.extract! book, :id, :name, :url, :readed_page, :user_id, :section_id, :created_at, :updated_at
json.url book_url(book, format: :json)
