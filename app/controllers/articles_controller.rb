class ArticlesController < ApplicationController

  http_basic_authenticate_with name: "edt", password: "pass", except: [:index, :show]

  def index
    @articles = Article.where(is_active: true).paginate(:per_page => 15, :page => params[:page])
  end
 
  def show
    @article = Article.find(params[:id])
  end
 
  def new
    @article = Article.new
  end
 
  def edit
    @article = Article.find(params[:id])
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
  
  def undestroy
    @article = Article.find(params[:id])
    @article.update(:is_active => true)
 
    redirect_to undelete_articles_path
  end


  private
    def article_params
      params.require(:article).permit(:title_rus, :title, :date, :src_url, :country, :author, :category, :keywords, :text, :lang)
    end
end