class VotesController < ApplicationController
  
  def create
    client_ip = request.remote_ip  
    
    vote = Vote.new
    vote.question_id = params[:id]
    vote.option_id = params[:vote]
    vote.ip = client_ip
    vote.save
    
    redirect_to results_path(params[:id])
  end
  
  
end
