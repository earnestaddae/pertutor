module Welcome
  class WelcomeEmailMailerJob < ApplicationJob
    # include Sidekiq::Worker
    # sidekiq_options retry: false
    # sidekiq_options retry: 5
    queue_as :default

    def perform(user, account)
      WelcomeEmailMailer.welcome_email(user, account).deliver #(wait: 5.minutes)
    end
  end
end
