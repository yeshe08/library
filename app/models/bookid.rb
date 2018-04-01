class Bookid < ApplicationRecord
    belongs_to :book_detail
    has_one :entry
end
