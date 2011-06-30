class ResultsController < ApplicationController
  
  def show
    @question = Question.find(params[:id])
    @options = Option.where(:question_id => params[:id])
    
    @total = Vote.where(:question_id => params[:id]).count
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
  
end
