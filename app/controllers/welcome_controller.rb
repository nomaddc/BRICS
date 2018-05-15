class WelcomeController < ApplicationController
  
  def index

    @articles = Article
    @sume = 0
    @sumr = 0
    param = params[:search]

    @keywordslst = [ 'bio',
	'brics+',
	'concluded_agreements',
	'digital',
	'ecology',
	'economic_challenges',
	'emerging_market',
	'expert_opinion',
	'fas',
	'foreign_ministers_meeting',
	'global_governance',
	'imf',
	'innovations',
	'investments',
	'media',
	'mofa',
	'movie',
	'national_security',
	'ndb',
	'obor',
	'off_docs',
	'pharmacy',
	'quotation',
	'rating',
	'research',
	'sergey_lavrov',
	'social_issues',
	'space',
	'speech',
	'sustainable_development',
	'terrorism',
	'top_level_meeting',
	'trade_relations',
	'un',
	'unclear',
	'vladimir_putin',
	'wang_yi',
	'wto',
	'xi_jinping',
	'xiamen_summit'
    ]

	
    @testingref = []
    @graph = [['ID', 'Distance', 'Y', 'Name', 'Frequency']]

    if params[:search] then
      cnt = 1
      medi = 0
      axX = 0
      axY = 0
      freq = Article.search(params[:search], :without => {:is_active => false}, :per_page => 9999).count
      @graph.push(['', 0, 1, params[:search], freq])

      @keywordslst.each do |c|
        if (c != params[:search]) then
          freq = Article.search(c+' AND '+params[:search], :without => {:is_active => false}, :per_page => 9999).count
          axX = (100.0/freq.to_f)
          medi = medi + axX
          cnt = cnt + 1
          if (axX < medi/cnt) then @graph.push(['', axX, 1, c, freq]) end
        end
      end
    end

    respond_to do |format|
      format.html
      format.json { render json: @keywordslst.to_json }
    end
  end

  private
    def allow_iframe
      response.headers.delete "X-Frame-Options"
    end
end
