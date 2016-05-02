class QuestionsController < ApplicationController
  def index
    @questions = Question.all.order("created_at DESC")
  end

  def show
    @question = Question.find(params[:id])
    @answers = @question.answers
  end

  def new
    @question = Question.new
  end

  def create
    @user = User.find(session[:id])
    @question = Question.new(params.require(:question).permit(:title, :body))
    @question.author = @user
    if @question.save
      redirect_to "/questions/#{@question.id}"
    else
      render 'new'
    end
  end

end
