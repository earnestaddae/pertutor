module Accounts
  class QuestionsController < Accounts::BaseController
    skip_after_action :verify_authorized
    before_action :set_question, only: [:show]

    def new
      @question = current_account.questions.build
      @question.user = current_user
    end


    def create
      @question = current_account.questions.build(question_params)
      @question.user = current_user
      if @question.save
        flash[:notice] = "Question successfully sent"
        redirect_to personal_questions_path
      else
        flash.now[:alert] = "Question not successfully sent"
        render :new
      end
    end

    def personal
      @question = current_account.questions.build
      @question.user = current_user
      @my_questions = current_account.questions.where(user: current_user).reverse_order
    end

    def show
    end



    private

      def question_params
        params.require(:question).permit(:title, :body)
      end

      def set_question
        @question = Question.friendly.find(params[:id])
      end
  end
end
