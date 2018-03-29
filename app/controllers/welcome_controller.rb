class WelcomeController < ApplicationController
  
  def index

    @articles = Article 
    @sume = 0
    @sumr = 0
    param = params[:search]

    @keywords = [
	'opt1',
	'opt2',
	'opt3'
    ]

    @period = [
	'last week',
	'last month',
	'last year'
    ]

    if params[:search] != nil
      @testing = Article.search params[:search], :without => {:is_active => false}, :ranker => :bm25, :per_page => 1
    else
      @testing = Article.search "d123reisahdsafg"
    end
  end
end
