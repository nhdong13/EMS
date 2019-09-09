User.create!(fullname: "Đây là admin!",
  email: "admin@mail.com",
  password: "123123",
  password_confirmation: "123123",
  role: User.roles[:admin],
  address: "HCM",
  create_by: nil)
User.create!(fullname: "Đây là trainee!",
  email: "trainee@mail.com",
  password: "123123",
  password_confirmation: "123123",
  role: User.roles[:trainee],
  address: "HCM",
  create_by: nil)
User.create!(fullname: "Đây là supervisor!",
  email: "sup@mail.com",
  password: "123123",
  password_confirmation: "123123",
  role: User.roles[:supervisor],
  address: "HCM",
  create_by: nil)    


10.times do
  Subject.create name: FFaker::Lorem.sentence,
    description: FFaker::Lorem.sentence,
    create_by: User.all.sample.id
end
  
30.times do
  Exam.create name: FFaker::Lorem.sentence,
    time_limit: rand(100),
    subject_id: Subject.all.sample.id,
    create_by: User.all.sample.id,
    mark_require: rand(100)
end
    
answers = (1..4).to_a.map {|i| FFakeer::Lorem.sentece.join("---")}

Question.create question_content: FFakeer::Lorem.sentece,
  answers: answers.join("---"),
  correct_answers: "2",
  subject_id: ,
  create_by: ,
  type: 1
