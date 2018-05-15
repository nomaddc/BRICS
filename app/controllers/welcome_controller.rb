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
    @graph = []
    @data = []

    if params[:search] then
      axX = 0
      axY = 0
      cnt = 0
      angle = [36, 72, 108, 144, 180, 216, 252, 288, 324, 360]

      @keywordslst.each do |c|
        if (c != params[:search]) then
          freq = Article.search(c, :without => {:is_active => false}, :per_page => 9999).count
          dist = Article.search(c+' AND '+params[:search], :without => {:is_active => false}, :per_page => 9999).count
          dist = 1000/dist.to_f
          @data.push([c, dist, freq])
        end
      end

      @data.sort! {|a,b| b[1] <=> a[1]}
      while @data.count > 10 do
        @data.pop
      end
      @data.shuffle!

      @data.each do |c|
        axY = c[1] * Math.sin(angle[cnt] * Math::PI/180)
        axX = c[1] * Math.cos(angle[cnt] * Math::PI/180)
        @graph.push(['', axX, axY, c[0], c[2]])
        cnt = cnt+1
      end

      freq = Article.search(params[:search], :without => {:is_active => false}, :per_page => 9999).count
      @graph.insert(0, ['', 0, 0, params[:search], freq])
      @graph.insert(0, ['', 'X', 'Y', 'Name', 'Frequency'])

      
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
