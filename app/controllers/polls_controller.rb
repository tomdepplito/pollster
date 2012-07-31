class PollsController < ApplicationController
  
  def index
    @polls = Poll.all
  end
  
  def new
    @poll = Poll.new
    3.times do
      question = @poll.questions.build
      #4.times { question.responses.build }
    end
  end
  
  def create
    @poll = Poll.new(params[:poll])
    @poll.edit_url = make_edit_url
    #@question = Question.new(params[:poll][:questions_attributes])
    # @response = Response.new(params[:responses_attributes])
    if @poll.save #&& @question.save && @response.save
      redirect_to polls_path, :flash => {:success => "Go to localhost:3000/#{@poll.edit_url} to edit your poll. Or go to localhost:3000/polls/#{@poll.id} to vote."}
    else
      flash[:error] = "Something went horribly wrong"
      render :new
    end
  end
  
  def show
    @poll = Poll.find(params[:id])
  end
  
  def edit
    @poll = Poll.find_by_edit_url(params[:slug])
  end
  
  def update
    @poll = Poll.find(params[:id])
    if @poll.update_attributes(params[:poll])
      redirect_to polls_path, :flash => {:success => "Success!"}
    else
      flash[:error] = "Something went horribly wrong"
      render :new
    end
  end
  
  def destroy
    if Poll.Find(params[:id]).destroy
      redirect_to root_path, :flash => {:success => "Poll deleted!"}
    else
      flash[:error] = "Something went horribly wrong"
      render :new
    end
  end
      
  def make_edit_url
    @edit_url = (0...5).map{ (0..9).to_a[rand(10)].to_s+('a'..'z').to_a[rand(26)] }.join
  end
end
