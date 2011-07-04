class StatsController < ApplicationController
  
  def index
    @votes = Vote.all
    @days = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
    
    @votes.each do |vote|
      @days[((Time.now.to_i - vote.created_at.to_i)/86400).floor] = @days[((Time.now.to_i - vote.created_at.to_i)/86400).floor] + 1
    end
    
    @questions = Question.all
    @dailyquestions = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
    
    @questions.each do |question|
      @dailyquestions[((Time.now.to_i - question.created_at.to_i)/86400).floor] = @dailyquestions[((Time.now.to_i - question.created_at.to_i)/86400).floor] + 1
    end
    
    @totalquestions = Question.all.count
    @totalvotes = Vote.all.count
    @totaloptions = Option.all.count
    
    @averagevotes = (@totalvotes.to_f/@totalquestions.to_f)
    @averageoptions = (@totaloptions.to_f/@totalquestions.to_f)
    
    # users online
    
    require 'open-uri'
    require 'json'
    
    result = JSON.parse(open('http://api.chartbeat.com/quickstats?host=poll.cm&apikey=c0c8b1c9686c75ab506a765fef1d1022').read)
    @onlinenow = result['people']
    
  end
  
end
