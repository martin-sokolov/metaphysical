class BooksController < ApplicationController
  def index
    @books = Book.all(:order => "title ASC")
  end

  def new
    @book = Book.new
  end

  def edit
    @book = Book.find(params[:id])
  end
  def rating
    @rates = Rating.where(:book_id => params[:book_id], :user_id => params[:user_id]).all
    if @rates.count == 0
      @rate = Rating.new(:value => params[:value],:user_id => params[:user_id],:book_id => params[:book_id])
      if @rate.save
        flash[:success] = "You've given rate to that book."
      else
        flash[:danger] = "Failure"
      end
    else
      flash[:warning] = "You gave it already."
    end
    redirect_to books_path
  end
  def create
    @book = Book.new(params[:book])
    if !params['imagefile'].nil?
      @book.image = params['imagefile'].original_filename
      handle_upload_file(params['imagefile'])
    end
    @book.rate = -1
    if @book.save
      flash[:success] = "Book has been added successfully!"
      redirect_to books_path
    else
      render 'new'
    end
  end

  def update
    @book = Book.find(params[:id])
    if !params['imagefile'].nil?
      @book.image = params['imagefile'].original_filename
      handle_upload_file(params['imagefile'])
    end
    if @book.update_attributes(params[:book])
      flash[:success] = "Book updated"
      redirect_to books_path
    else
      render 'edit'
    end
  end

  def destroy
    Book.find(params[:id]).destroy
    flash[:success] = "Book deleted."
    redirect_to books_path
  end
end
