class WelcomeController < ApplicationController
  
  def index

    @articles = Article.where(is_active: true)
    @sume = 0
    @sumr = 0
    param = params[:search]
  end
end
