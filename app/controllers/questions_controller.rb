class QuestionsController < ApplicationController
  def index
    @questions = Question.all.order("created_at DESC")
  end

  def show
    @question = Question.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @question = Question.new(post_params)
    if @questions.save
      redirect_to @question
    else
      render 'new'
    end
  end

end
