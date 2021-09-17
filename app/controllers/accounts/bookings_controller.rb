module Accounts
  class BookingsController < Accounts::BaseController
    skip_after_action :verify_authorized
    before_action :set_schedule, only: [:new, :create]

    def new
      # @booking = current_account.bookings.build
      @booking = @schedule.bookings.build
      @booking.account = current_account
      @booking.user = current_user
    end


    def create
      # @booking = current_account.bookings.build(booking_params)
      @booking = @schedule.bookings.build(booking_params)
      @booking.account = current_account
      @booking.user = current_user

      if @booking.save
        flash[:notice] = "Booking successful"
        redirect_to personal_bookings_path
        BookingMailer.student_booking_email(@booking).deliver
        BookingMailer.booking_notification_email(current_account.owner, @booking).deliver
      else
        flash.now[:alert] = "Booking not successful"
        render :new
      end
    end

    def personal
      @my_bookings = current_account.bookings.where(user: current_user).reverse_order
    end






    private

      def booking_params
        params.require(:booking).permit(:content, :title, :pay_type, :pay_provider)
        # params.require(:booking).permit(:content, :budget, :tuition_date, :title)
      end

      def set_schedule
        @schedule = Schedule.find(params[:schedule_id])
      end
  end
end
