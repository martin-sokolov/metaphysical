class ManifestosController < ApplicationController
  def index
    @page1 = Manifesto.find_by_pageid(1)
    @page2 = Manifesto.find_by_pageid(2)
  end
  def edit
    @page = Manifesto.find(params[:id])
  end
  def update
    @page = Manifesto.find(params[:id])
    if @page.update_attributes(params[:manifesto])
      flash[:success] = "Content has been updated!"
    else
      flash[:danger] = "Error ocurred..."
    end
    redirect_to manifestos_path
  end
end
