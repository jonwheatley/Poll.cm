class OptionsController < ApplicationController
  
  def show
    @question = Question.find(params[:id])
    @options = Option.where(:question_id => params[:id])
    @votes = Vote.new
  end
  
end
