class BookDoc < ApplicationRecord
    belongs_to :book_detail
    mount_uploader :pdf_doc, BookUploader
end
