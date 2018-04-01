class Domain < ApplicationRecord
    has_many :book_details

     def self.to_csv
      CSV.generate(headers: true) do |csv|
        csv << ["Domain Name", "Book Count"]
        Domain.all.map do |dd|
        csv << [dd.domain_name, dd.book_details.count]
        end
      end
  end
end
