source 'https://rubygems.org'
ruby '2.6.5'

gem 'rails',                   '5.1.4'

# gem 'rails',        '~> 5.1.6'
gem 'rails-i18n'
gem 'bcrypt'
gem 'faker'
# for image uploader with AWS S3 追加
gem 'carrierwave'
# 追加
gem 'fog-aws'
gem 'bootstrap-sass'
gem 'will_paginate'
gem 'bootstrap-will_paginate'
# gem 'puma',         '~> 3.7'
# 追加
gem 'puma', '~> 3.11'
gem 'sass-rails',   '~> 5.0'
gem 'uglifier',     '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'jquery-rails'
gem 'turbolinks',   '~> 5'
gem 'jbuilder',     '~> 2.5'
# 以下２つがLINE bot 機能実装の為、入れたgem
gem 'line-bot-api'
gem 'dotenv-rails'       #環境変数を管理するgem
gem 'whenever', require: false  # gem 'whenever'を追加する。
# 追加
gem 'mysql2', '~> 0.4.4'

group :development, :test do
  # コメントアウト
  # gem 'sqlite3', '1.3.13'
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :production do
  # コメントアウト
  # gem 'pg', '0.20.0'
end

# Windows環境ではtzinfo-dataというgemを含める必要があります
# Mac環境でもこのままでOKです
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]