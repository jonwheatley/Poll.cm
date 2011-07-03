class IndexController < ApplicationController
  
  def index
    @question = Question.new
  end
  
  def create 
    @question = Question.new
    
    # if there's a ? at the end, get rid of it. 
    last = params[:question][-1, 1]
    if last == "?"
      length = params[:question].length
      newlength = length -1
      @question.question = params[:question][0,newlength]
    else
      @question.question = params[:question]
    end
    
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
