class ArticlesController < ApplicationController

  def home
    @articles = Article.all
  end

  def show          # GET /restaurants/:id
    @article = Article.find(params[:id])
  end

  def new           # GET /restaurants/new
    @article = Article.new
  end

  def create        # POST /restaurants
    @article = Article.create(article_params)
    @article.save
    redirect_to root_path
  end

  def edit          # GET /restaurants/:id/edit
    @article = Article.find(params[:id])
  end

  def update        # PATCH /restaurants/:id
    @article = Article.find(params[:id])
    @article.update(article_params)
    redirect_to article_path
  end

  def destroy       # DELETE /restaurants/:id
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to root_path
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    # *Strong params*: You need to *whitelist* what can be updated by the user
    # Never trust user data!
    params.require(:article).permit(:title, :content)
  end
end
