class CategoriesController < ApplicationController
  def index
    @categories = Category.find_all_by_parent(0)
  end
  def show
    @category = Category.find(params[:id])
    @categories = Category.find_all_by_parent(0)
    @articles = Article.find_all_by_category_id(@category.id)
    if @category.parent == 0
      @subcats = Category.find_all_by_parent(@category.id)
      @articles += Article.find_all_by_category_id(@subcats.collect{|subcat| [subcat.id]})
    end
  end
  def new
    @category = Category.new
    @parents = Category.find_all_by_parent(0)
  end

  def edit
    @category = Category.find(params[:id])
    @parents = Category.find_all_by_parent(0)
  end

  def create
    @category = Category.new(params[:category])
    if @category.save
      flash[:success] = "Category has been added successfully!"
      redirect_to categories_path
    else
      @parents = Category.find_all_by_parent(0)
      render "new"
    end
  end

  def update
    @category = Category.find(params[:id])
    if @category.update_attributes(params[:category])
      flash[:success] = "Category updated"
      redirect_to categories_path
    else
      render 'edit'
    end
  end

  def destroy
    Category.find(params[:id]).destroy
    flash[:success] = "Category deleted."
    redirect_to categories_path
  end
end
