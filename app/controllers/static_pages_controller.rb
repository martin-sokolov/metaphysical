require "open-uri"
class StaticPagesController < ApplicationController
  def home

  end
  def loginfail

  end
  def contact
    if params[:subject].to_s() == ''
      flash[:warning] = "Please select subject which you want to ask for."
    else
      flash[:success] = "Email has been sent successfully!"
      Notifier.email_contact(params).deliver
    end
    redirect_to params[:prevurl]
  end
end
