class AnswersController < ApplicationController
  def new
    @answer = Answer.new
  end

  def create
    @question = Question.find(params[:question_id])
    @answer = Answer.new(params.require(:answer).permit(:body))
    @answer.author_id = session[:user_id]
    p session[:user_id]
    @answer.question_id = params[:question_id]
    p @answer
    if @answer.save
      redirect_to question_path(@question)
    else
      render "new"
    end
  end
end
