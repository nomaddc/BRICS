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
        'summit',
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
	'xiamen_summit',
        'political_issues',
        'narendra_modi',
        'cyril_ramaphosa',
        'business_council',
        'think_tank_council',
	'cooperation',
	'declaration',
	'partnership',
	'chairmanship',
	'jair_bolsonaro',
  'covid-19'
    ]
    @keywordslst.sort!
	
    @testingref = []
    @graph = []
    @data = []

    if !params[:search2] then
      params[:search2] = 'brics+'
    end

    if params[:search2] then
      axX = 0
      axY = 0
      cnt = 0
      angle = [36, 72, 108, 144, 180, 216, 252, 288, 324, 360]

      @keywordslst.each do |c|
        if (c != params[:search2]) then
          freq = Article.search(c, :without => {:is_active => false}, :per_page => 9999).count
          dist = Article.search(c+' AND '+params[:search2], :without => {:is_active => false}, :per_page => 9999).count
          dist = 1000/dist.to_f
          @data.push([c, dist, freq])
        end
      end

      @data.sort! {|a,b| a[1] <=> b[1]}
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

      freq = Article.search(params[:search2], :without => {:is_active => false}, :per_page => 9999).count
      @graph.insert(0, ['', 0, 0, params[:search2], freq])
      @graph.insert(0, ['', '', '', 'Category name', 'Mutual occurrences frequency'])

      
    end

    respond_to do |format|
      format.html
      format.json { render json: @keywordslst.to_json }
    end
  end

def index_rus

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
        'summit',
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
	'xiamen_summit',
        'political_issues',
        'narendra_modi',
        'cyril_ramaphosa',
        'sa_chairmanship',
        'business_council',
        'think_tank_council',
	'johannesburg_declaration'
    ]
    @keywordslst.sort!
	
    @testingref = []
    @graph = []
    @data = []

    if !params[:search2] then
      params[:search2] = 'brics+'
    end

    if params[:search2] then
      axX = 0
      axY = 0
      cnt = 0
      angle = [36, 72, 108, 144, 180, 216, 252, 288, 324, 360]

      @keywordslst.each do |c|
        if (c != params[:search2]) then
          freq = Article.search(c, :without => {:is_active => false}, :per_page => 9999).count
          dist = Article.search(c+' AND '+params[:search2], :without => {:is_active => false}, :per_page => 9999).count
          dist = 1000/dist.to_f
          @data.push([c, dist, freq])
        end
      end

      @data.sort! {|a,b| a[1] <=> b[1]}
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

      freq = Article.search(params[:search2], :without => {:is_active => false}, :per_page => 9999).count
      @graph.insert(0, ['', 0, 0, params[:search2], freq])
      @graph.insert(0, ['', '', '', 'Название категории', 'Частота совместных упоминаний'])

      
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
