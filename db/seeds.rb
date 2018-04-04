Author.create!([
  {author_name: "book author"}
])

Publisher.create!([
  {publisher_name: "Book buplisher"}
])
Domain.create!([
  {domain_name: "New Domain"}
])
BookDetail.create!([
  {book_name: "book 1", book_number: nil, book_edition: "2nd", author_type: "Foreign", domain_id: 1, author_id: 1, publisher_id: 1}
])
Role.create!([
  {role_name: "Admin", description: "access all things", role_code: "1"},
  {role_name: "User", description: "access only view", role_code: "2"}
])
User.create!([
  {name: "yeshwanth", user_id: nil, email: "yeshwanth@gmail.com", password: "yeshwanth", mobile: "1234567890", role_id: 1},
  {name: "velu", user_id: nil, email: "velu@gmail.com", password: "velu", mobile: "7397136939", role_id: 1},
  {name: "vv", user_id: "1234567", email: "vvv", password: "vvv", mobile: "vvv", role_id: 2}
])
Bookid.create!([
  {book_id: "12345", is_issue: true, is_blocked: true, book_detail_id: 1},
  {book_id: "6789", is_issue: true, is_blocked: true, book_detail_id: 1},
  {book_id: "6543", is_issue: true, is_blocked: true, book_detail_id: 1}
])
Entry.create!([
  {tempissue: true, issue_date: "2018-04-04", return_date: nil, bookid_id: 3, user_id: 3},
  {tempissue: false, issue_date: "2018-03-27", return_date: "2018-04-27", bookid_id: 1, user_id: 3},
  {tempissue: false, issue_date: "2018-03-27", return_date: "2018-04-27", bookid_id: 1, user_id: 3},
  {tempissue: true, issue_date: "2018-04-04", return_date: nil, bookid_id: 1, user_id: 3},
  {tempissue: true, issue_date: "2018-04-04", return_date: nil, bookid_id: 1, user_id: 3},
  {tempissue: false, issue_date: "2018-04-04", return_date: "2018-04-27", bookid_id: 2, user_id: 3}
])


