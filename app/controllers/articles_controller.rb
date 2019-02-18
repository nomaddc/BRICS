class ArticlesController < ApplicationController
  PRIORITY_COUNTRIES = %w[RU BR IN CN ZA]
  after_filter :allow_iframe, only: [:embed]
  http_basic_authenticate_with name: "edt", password: "pass", except: [:index, :show, :embed]

  def index
    if params[:search] == nil
      @articles = Article.filter(params.slice(:category, :country, :src_url, :date, :lang, :keywords, :keywords2, :title, :title_rus, :rel)).where(is_active: true).order('id DESC').paginate(:page => params[:page], :per_page => 9)
    else
      @articles = Article.search(params[:search], :without => {:is_active => false}, :page => params[:page], :per_page => 9, :order => :id)
    end

    @countries = ISO3166::Country.countries.sort_by do |country|
      priority_index = PRIORITY_COUNTRIES.index(country.alpha2)
      priority_index.present? ? priority_index.to_s : country.name
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
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
	'jair_bolsonaro'
    ]
    @article = Article.new
    respond_to do |format|
      format.html
      format.json { render json: @keywordslst.to_json }
    end
  end

  def edit
    @article = Article.find(params[:id])
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
	'jair_bolsonaro'
    ]
  end

  def create
    @article = Article.new(article_params)

    @article.lang = @article.title.blank? ? 'rus' : 'eng'

    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end

  def update
    @article = Article.find(params[:id])

    @article.lang = @article.title.blank? ? 'rus' : 'eng'

    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.update(:is_active => false)

    redirect_to articles_path
  end

  def undelete
    @articles = Article.where(is_active: false).paginate(:per_page => 15, :page => params[:page])
  end

  def embed
    @rese, @resr = 0
    if params[:search] == nil
      @articles = Article.where(is_active: true).order('id DESC').paginate(:page => params[:page], :per_page => 15)
    else
      @articles = Article.search(params[:search], :without => {:is_active => false}, :page => params[:page], :per_page => 15, :order => "id DESC")
      @rese = Article.search(params[:search], :without => {:is_active => false, :lang => 'rus'}).count
      @resr = Article.search(params[:search], :without => {:is_active => false, :lang => 'eng'}).count
    end
  end

  def undestroy
    @article = Article.find(params[:id])
    @article.update(:is_active => true)

    redirect_to undelete_articles_path
  end


  private
    def article_params
      params.require(:article).permit(:title_rus, :title, :date, :src_url, :country, :author, :category, :keywords2, :text, :lang, :rel, :keywords)
    end

    def allow_iframe
      response.headers.delete "X-Frame-Options"
    end
end
