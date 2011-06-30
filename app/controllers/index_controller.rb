class IndexController < ApplicationController
  
  def index
    @question = Question.new
  end
  
  def create 
    @question = Question.new
    @question.question = params[:question]
    @question.save
    
    
    @options = params[:option].split /[\r\n]+/
    
    
    @options.each do |options|
      newoption = Option.new
      newoption.option = options
      newoption.question_id = @question.id
      newoption.save
    end
    
    redirect_to options_path(@question)
  end
  
  
end
