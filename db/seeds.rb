# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# coding: utf-8

User.create!(name: "システム管理者",
             email: "sample@email.com",
             password: "password",
             password_confirmation: "password",
             tutor: false,
             parent: false,
             admin: true)

User.create!(name: "先生2",
             email: "sample2@email.com",
             password: "password",
             password_confirmation: "password",
             tutor: true,
             parent: false,
             admin: false)

User.create!(name: "先生3",
             email: "sample3@email.com",
             password: "password",
             password_confirmation: "password",
             tutor: true,
             parent: false,
             admin: false)

User.create!(name: "先生4",
             email: "sample4@email.com",
             password: "password",
             password_confirmation: "password",
             tutor: true,
             parent: false,
             admin: false)
             
User.create!(name: "生徒5",
             email: "sample5@email.com",
             password: "password",
             password_confirmation: "password",
             tutor: false,
             parent: true,
             admin: false)
             
User.create!(name: "生徒6",
             email: "sample6@email.com",
             password: "password",
             password_confirmation: "password",
             tutor: false,
             parent: true,
             admin: false)
             
User.create!(name: "生徒7",
             email: "sample7@email.com",
             password: "password",
             password_confirmation: "password",
             tutor: false,
             parent: true,
             admin: false)

intoduction_tutor = [
  'こんにちは。○×大学の学生です。アルバイトで塾講師をやっていたので教えることが得意です。よろしくお願いします。',
  'こんにちは。子供が好きで教師を目指して学校で勉強しています。よろしくお願いします。',
  'こんにちは。学問の楽しさを伝えられるよう工夫して教えています。よろしくお願いします。',
  'こんにちは。今まで１００人以上の子供たちに教えてきました。わかった時の子供たちの笑顔が好きです。よろしくお願いします。',
  'こんにちは。難しいことをわかりやすく伝えることが得意です。よろしくお願いします。'
] 

i = 0

30.times do |n|
  name = Faker::Name.name
  email ="sample-#{n+1}@email.com"
  password = "password"


  User.create(name: name,
              email: email,
              password: password,
              password_confirmation: password,
             tutor: true,
             parent: false,
             admin: false,
             favorite_subject: "英語",
             self_introduction: intoduction_tutor[i])
  i = i + 1
  if i > 4
    i = 0
  end
end

intoduction_parent = [
  'こんにちは。小学５年生と小学３年生の親です。いつも〇〇先生にお世話になっています。子供達も先生が大好きで楽しそうに勉強しています。',
  'こんにちは。中学生の息子に英語を教えてくれる先生を探しています。よろしくお願いします。',
  'こんにちは。大学受験を控えた娘にお勉強を教えてくれる先生を探しています。受験勉強のコツを教えていただきたいです。よろしくお願いします。',
  'こんにちは。子供に楽しくお勉強を教えてくれる先生を探しています。小学６年生の息子で、主に宿題をみていただきたいです。よろしくお願いいたします。',
  'こんにちは。高校２年生と中学生３年生の子供達に勉強を教えて欲しいです。親が教えようとしても難しくてわかりません。よろしくお願いいたします。'
] 

i = 0

30.times do |n|
  name = Faker::Name.name
  email ="sample-#{n+1}@email.com"
  password = "password"


  User.create(name: name,
              email: email,
              password: password,
              password_confirmation: password,
             tutor: false,
             parent: true,
             admin: false,
             self_introduction: intoduction_parent[i])
  i = i + 1
  if i > 4
    i = 0
  end
end