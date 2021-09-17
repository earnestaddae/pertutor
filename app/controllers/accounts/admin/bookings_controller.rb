module Accounts
  class Admin::BookingsController < Admin::ApplicationController
    def index
      @bookings = current_account.bookings.reverse_order
    end
  end
end
