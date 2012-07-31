class ResponsesController < ApplicationController
  def new
    @response = Response.new
    @questions = Poll.find(params[:poll_id]).questions
  end
  
  def create
    @questions = Poll.find(params[:poll_id]).questions
    @response = Response.new(params[:response])
    if @response.save
      redirect_to poll_response_path, :flash => {:success => "We appreciate your feedback!"}
    else
      flash[:error] = "Something went horribly wrong"
      render :new
    end
  end
end
