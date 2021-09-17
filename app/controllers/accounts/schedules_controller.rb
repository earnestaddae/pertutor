module Accounts
  class SchedulesController < Accounts::BaseController
    skip_after_action :verify_authorized

    def index
      @schedules = current_account.schedules.without_bookings.reverse_order
    end
  end
end
