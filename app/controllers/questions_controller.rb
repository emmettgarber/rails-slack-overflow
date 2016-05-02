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
    @question = Question.new(title: params[:title], body: params[:body], author: User.find(1))
    if @question.save
      redirect_to @question
    else
      render 'new'
    end
  end

end
