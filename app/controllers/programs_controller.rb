class ProgramsController < ApplicationController
  def index
    @programs = Program.all
  end

  def new
    @program = Program.new
    @videos = Video.find_all_by_pay(TRUE)
  end

  def show
    @program = Program.find(params[:id])
    @videos = Video.find(@program.videoids.split(","));
  end

  def edit
    @program = Program.find(params[:id])
    @videos = Video.find_all_by_pay(TRUE)
  end

  def create
    @program = Program.new(params[:program])
    if !params['imagefile'].nil?
      @program.image = params['imagefile'].original_filename
      handle_upload_file(params['imagefile'])
    end
    if @program.save
      flash[:success] = "Program has been added successfully!"
      redirect_to programs_path
    else
      @videos = Video.find_all_by_pay(TRUE)
      render 'new'
    end
  end

  def update
    @program = Program.find(params[:id])
    if !params['imagefile'].nil?
      @program.image = params['imagefile'].original_filename
      handle_upload_file(params['imagefile'])
    end
    if @program.update_attributes(params[:program])
      flash[:success] = "Program updated"
      redirect_to programs_path
    else
      render 'edit'
    end
  end

  def destroy
    Program.find(params[:id]).destroy
    flash[:success] = "Program deleted."
    redirect_to programs_path
  end
end
