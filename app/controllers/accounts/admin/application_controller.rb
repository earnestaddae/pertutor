module Accounts
  class Admin::ApplicationController < Accounts::BaseController
    skip_after_action :verify_authorized
    before_action :authorize_owner!

    def index
      @schedules = current_account.schedules.without_bookings.reverse_order
      @bookings = current_account.bookings.reverse_order
      @questions = current_account.questions.reverse_order
      @upcoming_bookings = current_account.bookings.upcoming_bookings
      @past_bookings = current_account.bookings.past_bookings
      # @lectures = current_account.lectures.reverse_order
      # @past_lectures = current_account.lectures.include_past_lessons.reverse_order
      # @upcoming_lectures = current_account.lectures.include_upcoming_lessons.reverse_order
      # @forums = current_account.forums.reverse_order
      # @users = current_account.users.reverse_order
      # @activities = PublicActivity::Activity.all
    end

    # # ensures the only the owner or those in an account can access it's content
    # def owner?
    #   current_account.owner == current_user
    # end
    # helper_method :owner?

    # ensures the only the owner or those in an account can access it's content
    def authorize_owner!
      return if owner?

      flash[:alert] = "Only an owner of an account can do that."
      redirect_to root_url(subdomain: current_account.subdomain)
    end

  end
end
