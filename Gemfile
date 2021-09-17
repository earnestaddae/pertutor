source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

# ruby '3.0.0'

# Rails default gems
gem 'rails', '~> 6.1.0'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 4.1'
gem 'sass-rails', '>= 6'
gem 'webpacker', '~> 4.0'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.7'
gem 'bootsnap', '>= 1.4.2', require: false

# pertutor gems
gem 'devise', '~> 4.7', '>= 4.7.3' # for authentication
gem 'devise_invitable', '~> 2.0', '>= 2.0.2' # for invitation
gem 'devise-async', '~> 1.0' # for processing devise bkg jobs
gem 'rolify', '~> 5.3' # for assigning roles
gem 'local_time', '~> 2.1' # for local time
gem 'bootstrap-email', '~> 0.3.2' # for bootstrap styled emails
gem 'pundit', '~> 2.1' # for authorization
gem 'carrierwave', '~> 2.1' # for image upload
gem 'mini_magick', '~> 4.9.5' # for image resizing
gem 'image_processing', '~> 1.12', '>= 1.12.1' # for image processing
gem 'active_storage_validations', '~> 0.9.0' # active_storage image validations
gem 'simple_form', '~> 5.0', '>= 5.0.3' # for forms
gem 'friendly_id', '~> 5.4.0' # for friendly urls
gem 'figaro', '~> 1.2' # for environment setup variables
gem 'sidekiq', '~> 6.1', '>= 6.1.2' # for processing bkg jobs
gem 'sidekiq-cron', '~> 1.2' # for scheduling bkg jobs
gem 'redis', '~> 4.2', '>= 4.2.2' # for saving bkgs jobs as well as actioncable
gem 'money-rails', '~> 1.13', '>= 1.13.3' # for money relate parsing
gem 'country_select', '~> 4.0' # for country selection
gem 'aws-sdk-s3', '~> 1.86', require: false # image upload in production on aws s3 bucket
gem 'name_of_person', '~> 1.1', '>= 1.1.1' # for person names
gem 'sendgrid-ruby', '~> 6.3', '>= 6.3.7' # for sending emails via sendgrid
gem 'twilio-ruby', '~> 5.42' # for sending text/sms
gem 'textris', '~> 0.7.1' # for sending sms as rails mailer
gem 'pagy', '~> 3.9' # for pagination
gem 'recaptcha', '~> 5.6' # for recaptcha to limit bot sign ups
gem 'gravatar_image_tag', '~> 1.2' # for parsing gravatar icons/images
gem 'pry-rails', '~> 0.3.9' # for console nice output
gem 'awesome_print', '~> 1.8' # for nice console output
gem 'ransack', '~> 2.3', '>= 2.3.2' # for search forms simple & advanced
gem 'pg_search', '~> 2.3', '>= 2.3.5' # for postgresql search for model
gem 'public_activity', '~> 1.6', '>= 1.6.4' # to track activities on account
gem 'chartkick', '~> 3.4', '>= 3.4.2' # for graphs / charts
gem 'groupdate', '~> 5.2', '>= 5.2.1' # for grouping dates with chartkick
gem 'acts_as_tenant', '~> 0.5.0' # for row-level multitenancy
gem 'rubocop', '~> 1.6', '>= 1.6.1', require: false # ensures my code follows ruby style
gem 'simple_calendar', '~> 2.4', '>= 2.4.1' # for calendar to display schedules
# gem 'social-share-button', '~> 1.2', '>= 1.2.3' # for social media sharing
# gem 'fog-aws', '~> 3.6', '>= 3.6.7' # for image upload with aws s3 bucket
# gem 'sendgrid-actionmailer', '~> 3.1', '>= 3.1.1' # for sending emails via https web api

group :production do
  gem 'exception_notification', '~> 4.4', '>= 4.4.3' # sends production error to developer
end


group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'better_errors', '~> 2.9', '>= 2.9.1' # for better error pages
  gem 'binding_of_caller', '~> 0.8.0' # for finding faults
  gem 'letter_opener', '~> 1.7' # for email delivery in development environment
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'foreman', '~> 0.87.2' # for handling multiple process. Thank you! Webpack!🙄
  gem 'annotate', '~> 3.1', '>= 3.1.1' # for annotating activerecord models
  gem 'brakeman', '~> 4.10' # checks for security vulnerabilities
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end

# gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

