module Accounts
  class RegistrationsController < Accounts::BaseController
    skip_after_action :verify_authorized
    before_action :set_lecture, except: [:enrolled]
    before_action :set_registration, only: [:destroy, :show]

    def new
      @registration = @lecture.registrations.build
      @registration.account = current_account
    end

    def create
      @registration = @lecture.registrations.build(registration_params)
      @registration.account = current_account
      @tutor = @lecture.user # finds the lecture's instructor
      @registration.lecture_id = @lecture.id # assigns the registration to the right lecture
      @registration.student_id = current_user.id # student registration
      @registration.tutor_id = @tutor.id # find tutor

      # checks that a student registers once to a lesson
      # used scope to avoid page redirect
      # if @registration.lecture.students.include?(current_user)
      #   flash[:alert] = "You can only register once per lesson"
      #   redirect_to(lectures_path) and return
      # end

       if @registration.save
        flash[:notice] = "You've successfully booked your seat! 🙌"
        # redirect_to(lecture_path(@lecture)) and return
        redirect_to enrolled_path
      else
        flash.now[:alert] = "Registration not successful"
        render :new
      end
    end

    def enrolled
      @registrations = current_account.registrations.where(student: current_user).reverse_order
    end

    def destroy
      current_account.registrations.delete(@registration)
      # @registration.destroy
      flash[:notice] = "You've Unenrolled successfully"
      redirect_to lectures_path
    end




    private

      def set_lecture
        @lecture = Lecture.friendly.find(params[:lecture_id])
      end


      def registration_params
        params.require(:registration).permit(:pay_type, :pay_provider)
      end

      def set_registration
        @registration = Registration.find(params[:id])
      end
  end
end
