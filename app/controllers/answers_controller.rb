class AnswersController < ApplicationController
  def new
    @answer = Answer.new
  end

  def create
    @answer = Answer
  end
end
