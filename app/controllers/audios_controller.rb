class AudiosController < ApplicationController
  def index
    @audios = Audio.all
  end

  def new
    @audio = Audio.new
  end

  def create
    @audio = Audio.new(params[:audio])
    if !params['imagefile'].nil?
      @audio.image = params['imagefile'].original_filename
      handle_upload_file(params['imagefile'])
    end
    if !params['audiofile'].nil?
      @audio.url = params['audiofile'].original_filename
      handle_upload_file(params['audiofile'])
    end
    if @audio.save
      flash[:success] = "Audio has been added successfully!"
      redirect_to audios_path
    else
      render 'new'
    end
  end

  def destroy
    Audio.find(params[:id]).destroy
    flash[:success] = "Audio deleted."
    redirect_to audios_path
  end
end
