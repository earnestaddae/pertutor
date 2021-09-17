module Accounts
  class Admin::LecturesController < Admin::ApplicationController
    before_action :set_lecture, only: [:edit, :update, :destroy]

    def new
      # @lecture = Lecture.new
      @lecture = current_account.lectures.build
      authorize @lecture, :new?
    end

    def create
      @lecture = current_account.lectures.build(lecture_params)
      authorize @lecture, :create?
      @lecture.user = current_user
      if @lecture.save
        flash[:notice] = "Lesson successfully created"
        # redirect_to root_url(subdomain: current_account.subdomain)
        redirect_to lectures_path
      else
        flash.now[:alert] = "Sorry, lesson wasn't created"
        render :new
      end
    end

    def edit
      authorize @lecture, :edit?
    end

    def update
      authorize @lecture, :update?
      if @lecture.update(lecture_params)
        flash[:notice] = "Lesson successfully updated"
        # redirect_to root_url(subdomain: current_account.subdomain)
        redirect_to lecture_path(@lecture)
      else
        flash.now[:alert] = "Sorry, lesson wasn't updated"
        render :edit
      end
    end

    def destroy
      # @lecture.destroy
      authorize @lecture, :destroy?
      current_account.lectures.delete(@lecture)
      flash[:notice] = "Lesson successfully deleted"
      redirect_to root_url(subdomain: current_account.subdomain)
    end



    private

      def lecture_params
        params.require(:lecture).permit(:title, :summary, :start_date, :end_date, :description, :price, :student_limit)
      end

      def set_lecture
        @lecture = Lecture.friendly.find(params[:id])

        rescue ActiveRecord::RecordNotFound
        flash[:alert] = "Lesson not found"
        redirect_to root_url(subdomain: current_account.subdomain)
      end
  end
end
