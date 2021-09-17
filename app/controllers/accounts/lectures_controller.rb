module Accounts
  class LecturesController < Accounts::BaseController
    # skip_after_action :verify_authorized
    before_action :set_lecture, only: [:show]

    def index
      @lectures = current_account.lectures.include_upcoming_lessons.reverse_order
      authorize @lectures, :index?
    end


    def show
      authorize @lecture, :show?
    end



    private

      def set_lecture
        @lecture = Lecture.friendly.find(params[:id])

        rescue ActiveRecord::RecordNotFound
        flash[:alert] = "Lesson not found"
        redirect_to root_url(subdomain: current_account.subdomain)
      end
  end
end
