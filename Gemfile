source "https://rubygems.org"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem "bcrypt", "~> 3.1", ">= 3.1.11"
gem "bootstrap-sass"
gem "coffee-rails", "~> 4.2"
gem "config", "~> 1.4"
gem "devise"
gem "figaro", "~> 1.1", ">= 1.1.1"
gem "font-awesome-rails"
gem "jbuilder", "~> 2.5"
gem "jquery-rails"
gem "mysql2", ">= 0.3.18", "< 0.5"
gem "omniauth"
gem "omniauth-facebook"
gem "omniauth-google-oauth2"
gem "paperclip", "~> 4.1"
gem "popper_js", "~> 1.12", ">= 1.12.3"
gem "puma", "~> 3.7"
gem "rails", "~> 5.1.3"
gem "sass-rails", "~> 5.0"
gem "simple_form", "~> 3.2"
gem "shoulda", "~> 3.5"
gem "turbolinks"
gem "uglifier", ">= 1.3.0"
gem "kaminari"
gem "bootstrap-kaminari-views"
gem "ckeditor", "~> 4.1"
gem "carrierwave", "~> 1.1"
gem "mini_magick"

group :development, :test do
  gem "autoprefixer-rails"
  gem "better_errors"
  gem "brakeman", require: false
  gem "bundler-audit"
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
  gem "capybara", "~> 2.13"
  gem "database_cleaner"
  gem "eslint-rails", git: "https://github.com/octoberstorm/eslint-rails", require: false
  gem "factory_girl_rails"
  gem "guard-rspec", require: false
  gem "jshint"
  gem "railroady"
  gem "rails_best_practices"
  gem "reek"
  gem "rspec"
  gem "rspec-collection_matchers"
  gem "rspec-rails"
  gem "rubocop", "~> 0.35.0", require: false
  gem "rubocop-checkstyle_formatter", require: false
  gem "scss_lint_reporter_checkstyle", require: false
  gem "scss_lint", require: false
  gem "selenium-webdriver"
end

group :development do
  gem "web-console", ">= 3.3.0"
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
end

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
