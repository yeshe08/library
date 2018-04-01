json.extract! book_detail, :id, :book_name, :book_number, :book_edition, :author_type, :domain_id, :author_id, :publisher_id, :book_doc_id, :created_at, :updated_at
json.url book_detail_url(book_detail, format: :json)
