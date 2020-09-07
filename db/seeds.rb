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

User.create!(name: "先生１",
             email: "sample2@email.com",
             password: "password",
             password_confirmation: "password",
             tutor: true,
             parent: false,
             admin: true)

User.create!(name: "生徒１",
             email: "sample3@email.com",
             password: "password",
             password_confirmation: "password",
             tutor: false,
             parent: true,
             admin: false)

