module Accounts
  class Admin::SchedulesController < Admin::ApplicationController
    before_action :set_schedule, only: [:edit, :update, :destroy]


    def index
      @schedules = current_account.schedules.without_bookings.reverse_order
    end


    def new
      @schedule = current_account.schedules.build
      @schedule.user = current_user
    end

    def create
      @schedule = current_account.schedules.build(schedule_params)
      @schedule.user = current_user

      if @schedule.save
        flash[:notice] = "Timetable created successfully"
        redirect_to admin_schedules_path
      else
        flash.now[:alert] = "Sorry, timetable wasn't created"
        render :new
      end
    end


    def edit
    end

    def update
      @schedule.user = current_user
      @schedule.account = current_account
      if @schedule.update(schedule_params)
        flash[:notice] = "Timetable updated successfully"
        # redirect_to root_url(subdomain: current_account.subdomain)
        redirect_to admin_schedules_path
      else
        flash.now[:alert] = "Sorry, timetable wasn't updated"
        render :edit
      end
    end

    def destroy
      current_account.schedules.delete(@schedule)
      flash[:notice] = "Schedule successfully deleted"
      redirect_to admin_schedules_path
    end





    private


      def schedule_params
        params.require(:schedule).permit(:available_date, :students_allowed, :price, :medium)
      end

      def set_schedule
        @schedule = Schedule.find(params[:id])
      end
  end
end
