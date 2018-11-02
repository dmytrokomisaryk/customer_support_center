# frozen_string_literal: true

ruby '2.5.1'

source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'active_model_serializers', '~> 0.10.0'
gem 'activeadmin'
gem 'bootstrap-sass'
gem 'devise'
gem 'font-awesome-sass', '~> 4.7.0'
gem 'json', github: 'flori/json', branch: 'v1.8'
gem 'kaminari'
gem 'puma', '~> 3.0'
gem 'rails', '~> 5.0.2'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'

gem 'angular-rails-templates'
gem 'bower-rails', '~> 0.11.0'

gem 'pg'

gem 'reference', github: 'dmytrokomisaryk/reference'

group :development, :test do
  gem 'letter_opener_web'
  gem 'pry-rails'
  gem 'rubocop', '~> 0.58.2', require: false
end
