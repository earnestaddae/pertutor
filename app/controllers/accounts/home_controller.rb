module Accounts
  class HomeController < Accounts::BaseController
    skip_after_action :verify_authorized

    def index
      # @available_bookings = current_account.bookings.available_bookings.reverse_order
      @schedules = current_account.schedules.without_bookings.limit(4).reverse_order
      # @schedules = current_account.schedules.includes(:bookings).reverse_order
      # @lectures = current_account.lectures.include_upcoming_lessons.limit(4).reverse_order
      # @forums = current_account.forums.all.reverse_order
      # current_account
    end
  end
end
