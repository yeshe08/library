class BookDetail < ApplicationRecord
  belongs_to :domain
  belongs_to :author
  belongs_to :publisher
  has_many :book_docs
  # has_many :entries
  has_many :bookids



  def self.to_csv
      CSV.generate(headers: true) do |csv|
        csv << ["Book Id", "Book Name", "Book Number", "Author Name", "Publisher", "Domain", "Author Type"]
        BookDetail.all.map do |book|
        csv << [book.id, book.book_name, book.book_number, book.author.author_name,book.publisher.publisher_name, book.domain.domain_name, book.author_type]
        end
      end
  end

end
