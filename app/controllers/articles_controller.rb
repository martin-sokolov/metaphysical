class ArticlesController < ApplicationController
  before_filter :load_categories, :except => :destroy
  def index
    @categories = Category.find_all_by_parent(0)
    @articles = Article.all
  end
  def search
    @categories = Category.find_all_by_parent(0)
    @articles = Article.search(params[:keyword])
    @search_for = "Search results for \"#{params[:keyword]}\""
    render :action => 'index'
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
    @article =Article.new(params[:article])
    if !params['imagefile'].nil?
      @article.image = params['imagefile'].original_filename
      handle_upload_file(params['imagefile'])
    end
    if @article.save
      flash[:success] = "Article has been posted successfully!"
      redirect_to params[:backurl]
    else
      render :action => "new"
    end
  end
  def update
    @article = Article.find(params[:id])
    if !params['imagefile'].nil?
      @article.image = params['imagefile'].original_filename
      handle_upload_file(params['imagefile'])
    end
    if @article.update_attributes(params[:article])
      flash[:success] = "Article updated"
      redirect_to params[:backurl]
    else
      render 'edit'
    end
  end
  def destroy
    Article.find(params[:id]).destroy
    flash[:success] = "Article deleted."
    redirect_to life_path
  end
  private
    def load_categories
      @categories = Array.new
      cats = Category.find_all_by_parent(0)
      cats.each do |cat|
        @categories << cat
        subcats = Category.find_all_by_parent(cat.id)
        subcats.each do |subcat|
          subcat.title = " - "+subcat.title
          @categories << subcat
        end
      end
    end
end
