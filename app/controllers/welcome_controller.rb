class WelcomeController < ApplicationController
  
  def index

    @articles = Article
    @sume = 0
    @sumr = 0
    param = params[:search]

    @keywordssel = [
	' AND ',
	' !',
	' MAYBE '
    ]

    @period = [
	'last week',
	'last month',
	'last year'
    ]

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

    if params[:search] != nil
      @testing = Article.search params[:search], :without => {:is_active => false}, :ranker => :bm25, :per_page => 2
    else
      @testing = Article.search "d123reisahdsafg"
    end
	
    @testingref = []
    @graph = [['ID', 'Distance', 'Y', 'Name', 'Frequency']]

    

    if params[:search2] then
      @keywordslst.each do |i|
        cnt = Article.search(i+' AND '+params[:search2], :without => {:is_active => false}, :per_page => 9999).count
        @testingref.push([i, cnt])
      end
    end

    if params[:search3] then
      cnt = 1
      medi = 0
      freq1 = Article.search(params[:search3], :without => {:is_active => false}, :per_page => 9999).count
      @graph.push([params[:search3], 0, 1, params[:search3], freq1])
      @keywordslst.each do |c|
        if (c != params[:search3]) then
        freq1 = Article.search(c, :without => {:is_active => false}, :per_page => 9999).count
        freq2 = Article.search(c+' AND '+params[:search3], :without => {:is_active => false}, :per_page => 9999).count
        freq3 = (100.0/freq2.to_f)*1.0
        medi = medi + freq3
        cnt = cnt + 1
        if (freq3 <= medi/cnt) then @graph.push([c, freq3, 1, c, freq1]) end
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
