class QuestionsController < ApplicationController
  def index
    @questions = Question.all.order("created_at DESC")
  end

  def show
    @question = Question.find(params[:id])
  end

  def new
    @question = Question.new
  end

  def create
    @user = User.find(session[:user_id])
    @question = Question.new(params.require(:question).permit(:title, :body))
    @question.author = @user
    if @question.save
      redirect_to "/questions/#{@question.id}"
    else
      render 'new'
    end
  end
  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    if @question.update(params[:question].permit(:title, :body))
      redirect_to @question
    else
      render 'edit'
    end
  end

  def destroy
    Question.find(params[:id]).destroy
    redirect_to root_path
  end
end
