module Accounts
  class Admin::QuestionsController < Admin::ApplicationController
    def index
      @questions = current_account.questions.reverse_order
    end
  end
end
