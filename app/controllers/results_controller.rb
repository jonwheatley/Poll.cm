class ResultsController < ApplicationController
  
  def show
    @question = Question.find(params[:id])
    @options = Option.where(:question_id => params[:id])
    
    @total = Vote.where(:question_id => params[:id]).count
    @av = 100/@total
  end
  
end
