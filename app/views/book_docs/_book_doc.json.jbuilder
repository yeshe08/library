json.extract! book_doc, :id, :book_name, :pdf_doc, :created_at, :updated_at
json.url book_doc_url(book_doc, format: :json)
