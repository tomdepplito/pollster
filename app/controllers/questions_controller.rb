# class QuestionsController < ApplicationController
#   
#   def new
#     @question = Question.new
#   end
#   
#   def create
#     @question = Question.new(params[:question])
#     if @question.save
#       flash[:success] = "You added a Question!"
#       redirect_to polls_path
#     else
#       flash[:error] = "Something went horribly wrong"
#       render :new
#     end
#   end
# end
