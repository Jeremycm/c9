class PhotosController < ApplicationController
  before_filter :login_authenticate
    def index
      @photos = Photo.all
    end
  def new
    @photo = Photo.new
  end
  
  def show
    @photo = Photo.find(params[:id])  
    
  end
  
  def create
    @photo = Photo.new(photo_params)
    if @photo.save
      flash[:success] = "The photo was added!"
      redirect_to controller: 'photos'
    else
      render 'new'
    end
  end
  
  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy
    
    redirect_to controller: 'photos'
  end
  

  private

  def photo_params
    params.require(:photo).permit(:image, :title)
  end
end
