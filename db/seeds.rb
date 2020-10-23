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
             self_introduction: "こんにちは。○×大学の学生です。英語が好きで、留学経験１年です。")
end

