class ResultsController < ApplicationController
  
  def index
    @question = Question.find(params[:id])
    
    @options = Option.where(:question_id => params[:id])
    
    @total = Vote.where(:question_id => params[:id]).count
    
    if @total == 0
      redirect_to options_path(@question)
    else
    
      @av = 100/@total
    
      @optionsgraph = ""
      @votesgraph = ""
    
      @options.each do |option|
        @optionsgraph = "#{@optionsgraph}|#{option.option[0..10]}..."
        @votesgraph = "#{@votesgraph},#{option.votes.count}"
      end
    
      @optionsgraph = @optionsgraph[1..-1]
      @votesgraph = @votesgraph[1..-1]
    
    end
    
    @title = Question.find(params[:id]).question
  end
  
end
