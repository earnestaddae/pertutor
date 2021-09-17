module Invitations
  class InvitationMailerJob < ApplicationJob
    # include Sidekiq::Worker
    # sidekiq_options retry: false
    # sidekiq_options retry: 5
    queue_as :default

    def perform(invitation)
      InvitationMailer.invite(invitation).deliver
    end
  end
end
