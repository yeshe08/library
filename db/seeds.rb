Role.create!([
  {role_name: "Admin", description: "access all things", role_code: "1"},
  {role_name: "User", description: "access only view", role_code: "2"}
])
User.create!([
  {name: "yeshwanth", user_id: nil, email: "yeshwanth@gmail.com", password: "yeshwanth", mobile: "1234567890", role_id: 1},
  {name: "Keerthana", user_id: nil, email: "keerthana@gmail.com", password: "keerthana", mobile: "9626687875", role_id:1}
])


