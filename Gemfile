source 'https://rubygems.org'

gem 'figaro' # 환경 변수 보호용 gem
gem 'devise' #로그인

gem 'client_side_validations' #for 프론트 선에서 예외처리 하기

#facebook login  
gem 'omniauth-facebook', '~> 4.0.0'
gem 'omniauth'

gem 'impressionist' # 조회수 집계 (동일 ip 중복 집계 x)
gem 'punching_bag'  # 조회수 집계 (중복 집계 o)

gem 'roo' #엑셀을 db로 슝
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem "mini_magick" #for image edit and for gem 'bootsy'
gem "fog-aws" #carrierwave를 통해 아마존s3에 전송 https://github.com/carrierwaveuploader/carrierwave
gem 'carrierwave' #사진 첨부 기능 제공
gem 'will_paginate', '~> 3.0' #페이지 번호 부여 및 번호를 통한 이동을 위한 젬 파일
gem 'acts_as_votable', '~> 0.10.0' #찜하기 기능을 위한 젬 파일 (별점 기능도 이 젬파일로 구현 가능 할 듯)
gem 'rails_autolink', '~> 1.1', '>= 1.1.6' #auto link maker
gem 'ckeditor', github: 'galetahub/ckeditor' # text editor
gem "non-stupid-digest-assets" # Ckeditor production 모드에서 안되는거 해결


gem 'rails', '4.2.5'
# Use sqlite3 as the database for Active Record
gem 'sqlite3'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
gem 'bootstrap-sass', '~> 3.3.6'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jquery-turbolinks'
# 페이지 리프레시 해줘야 jquery 작동하는 거 방지
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw]  # gem for local development in Windows
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

