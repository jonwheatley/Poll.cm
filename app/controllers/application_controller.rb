class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :footer
  
  def footer
    @totalquestions = Question.all.count+6206
    @totalvotes = Vote.all.count+54742
  end
end
