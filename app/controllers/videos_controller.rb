class VideosController < ApplicationController
  def index
    @videos = Video.all
  end
  def new
    @video = Video.new
  end
  def create
    @video = Video.new(params[:video])
    if !params['videofile'].nil?
      @video.url = params['videofile'].original_filename
      handle_upload_file(params['videofile'])
    end

    if !params['thumbfile'].nil?
      @video.thumb = params['thumbfile'].original_filename
      handle_upload_file(params['thumbfile'])
    end

    if @video.save
      flash[:success] = "Video has been added successfully!"
      redirect_to videos_path
    else
      render 'new'
    end
  end
  def destroy
    Video.find(params[:id]).destroy
    flash[:success] = "Video deleted."
    redirect_to videos_path
  end
end
