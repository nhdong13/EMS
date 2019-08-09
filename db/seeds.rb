User.create!(fullname: "Đây là admin!",
  email: "admin@mail.com",
  password: "123123",
  password_confirmation: "123123",
  role: User.roles[:admin],
  create_by: nil)
