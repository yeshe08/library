Role.create!([
  {role_name: "Admin", description: "access all things", role_code: "1"},
  {role_name: "User", description: "access only view", role_code: "2"}
])
User.create!([
  {name: "yeshwanth", email: "yeshwanth@gmail.com", password: "yeshwanth", mobile: "1234567890", role_id: 1},
  {name: "velu", email: "velu@gmail.com", password: "velu", mobile: "7397136939", role_id: 1},
  {name: "vv", email: "vvv", password: "vvv", mobile: "vvv", role_id: 2}
])
