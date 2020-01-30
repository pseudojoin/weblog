class ArticlesController < ApplicationController

  before_action :authenticate_user!, except: [:show, :index]

  def index
    @articles = Article.all.order(:id)
  end

  def show
    @article = Article.find(params[:id])
    NotifierMailer.with(article: @article).article_email.deliver_now
    respond_to do |format|
      format.js { render 'show' }
    end
  end

  def show_all
    @articles = Article.all.order(:id)
    respond_to do |format|
      format.js { render 'articles_table' }
    end
  end

  def new
    @article = Article.new
    respond_to do |format|
      format.js { render 'new' }
    end
  end

  def edit
    @article = Article.find(params[:id])
    respond_to do |format|
      format.js { render 'edit' }
    end
  end

  def search
    respond_to do |format|
      format.js { render 'search' }
    end
  end

  def search_result
    # binding.pry_remote
    query = params[:query].presence && params[:query]
    if query
      @articles = Article.search_filtered(query)
      render partial: 'articles_table'
    end
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      respond_to do |format|
        format.js { render 'show' }
      end
    else
      respond_to do |format|
        format.js { render 'new' }
      end
    end
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      respond_to do |format|
        format.js { render 'show' }
      end
    else
      respond_to do |format|
        format.js { render 'edit' }
      end
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    @articles = Article.all.order(:id)
    respond_to do |format|
      format.js { render 'articles_table' }
    end
  end

private
  def article_params
    params.require(:article).permit(:title, :text, :query)
  end
end
