class WelcomeController < ApplicationController
  
  def index

    @articles = Article 
    @sume = 0
    @sumr = 0
    param = params[:search]
  end
end
