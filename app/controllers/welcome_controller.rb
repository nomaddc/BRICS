class WelcomeController < ApplicationController
  
  def index

    @articles = Article.where(is_active: true)
    @sum = 0
  end
end
