class StatsController < ApplicationController
  
  def index
    @all = Vote.all
    
    @days = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
    
    @all.each do |vote|
      @days[((Time.now.to_i - vote.created_at.to_i)/86400).floor] = @days[((Time.now.to_i - vote.created_at.to_i)/86400).floor] + 1
    end
  end
  
end
