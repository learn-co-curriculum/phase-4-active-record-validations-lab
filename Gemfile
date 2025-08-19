source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

# Ruby version
ruby '3.3.5'

# Rails 7.1 and modern gems
gem 'ostruct' # Required for Ruby 3.5+
gem 'puma', '~> 6.0'
gem 'rack-cors'
gem 'rails', '~> 7.1.0'
gem 'sqlite3', '~> 1.6.0'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'rspec-rails', '~> 6.0'
  gem 'webrick' # Needed for Rails 7+ in dev/test
end

group :development do
  gem 'listen', '~> 3.3'
  gem 'rubocop', require: false
end

group :test do
  gem 'rspec-json_expectations'
  gem 'shoulda-matchers', '~> 5.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
