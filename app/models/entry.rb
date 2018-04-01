class Entry < ApplicationRecord
  belongs_to :bookid
  belongs_to :user

  def self.to_csv

   CSV.generate(headers: true) do |csv|
      csv << ["Student", "Issue Date","Return Date","Book Name"]
      Entry.all.map do|ee|
        csv<< [ee.user.name, ee.issue_date, ee.return_date, ee.bookid.book_detail.book_name]
      end
    end
end
end
