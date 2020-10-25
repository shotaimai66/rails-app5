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

intoduction_texts = [
  'こんにちは。○×大学の学生です。アルバイトで塾講師をやっていたので教えることが得意です。よろしくお願いします。',
  'こんにちは。子供が好きで教師を目指して学校で勉強しています。よろしくお願いします。',
  'こんにちは。学問の楽しさを伝えられるよう工夫して教えています。よろしくお願いします。',
  'こんにちは。今まで１００人以上の子供たちに教えてきました。わかった時の子供たちの笑顔が好きです。よろしくお願いします。',
  'こんにちは。難しいことをわかりやすく伝えることが得意です。よろしくお願いします。'
] 

i = 0

60.times do |n|
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
             self_introduction: intoduction_texts[i])
  i = i + 1
  if i > 4
    i = 0
  end
end
