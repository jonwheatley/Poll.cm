class OptionsController < ApplicationController
  
  def show
    
    @question = Question.find(params[:id])
    
    @client_ip = request.remote_ip 
    if !Vote.where(:question_id => params[:id].to_i, :ip => @client_ip).empty?
      redirect_to(results_path(@question))
    end
    
    @options = Option.where(:question_id => params[:id])
    @votes = Vote.new
    
    @title = @question.question + "?" # add custom title
  end
  
end
