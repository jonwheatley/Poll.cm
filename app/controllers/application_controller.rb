class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :footer
  
  def footer
    @totalquestions = Question.all.count
    @totalvotes = Vote.all.count
  end
end
