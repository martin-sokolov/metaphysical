class FaqsController < ApplicationController
  def index
      @faqs = Faq.all
  end

  def new
      @faq = Faq.new
  end

  def create
    @faq = Faq.new(params[:faq])
    if @faq.save
      flash[:success] = "Question has been added successfully!"
      redirect_to faqs_path
    else
      render 'new'
    end
  end

  def edit
    @faq = Faq.find(params[:id])
  end

  def update
    @faq = Faq.find(params[:id])
    if @faq.update_attributes(params[:faq])
      flash[:success] = "Question updated"
      redirect_to faqs_path
    else
      render 'edit'
    end
  end

  def destroy
    Faq.find(params[:id]).destroy
    flash[:success] = "Question deleted."
    redirect_to faqs_path
  end
end
