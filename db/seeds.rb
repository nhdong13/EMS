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
    
answers = {
  a: FFaker::Lorem.sentence,
  b: FFaker::Lorem.sentence,
  c: FFaker::Lorem.sentence,
  d: FFaker::Lorem.sentence
}.to_json

10.times do
  answers = {
    a: FFaker::Lorem.sentence,
    b: FFaker::Lorem.sentence,
    c: FFaker::Lorem.sentence,
    d: FFaker::Lorem.sentence
  }.to_json
  
  Question.create question_content: FFaker::Lorem.sentence,
    answers: answers,
    correct_answers: "2",
    subject_id: Subject.all.sample.id,
    create_by: User.all.sample.id,
    type_of_question: Question.type_of_questions.keys.sample
end



UserHasSubject.create user_id: User.find(2).id, subject_id: Subject.find(1).id

10.times do
  ExamHasQuestion.create question_id: Question.all.sample.id, exam_id: 58,
  mark: 1
end
