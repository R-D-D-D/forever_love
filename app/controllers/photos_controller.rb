class PhotosController < ApplicationController
  def new
    @event = Event.find(params[:event_id])
    @photo = @event.photos.new
  end

  def create
    @event = Event.find(params[:id])
    if params[:photo][:portrait] == '1'
      @photo = @event.photos.build(photo_params)
      @photo.update_attribute(:portrait, true)
    else
      @photo = @event.photos.build(photo_params)
      @photo.update_attribute(:portrait, false)
    end
    if @photo.save
      flash[:success] = "添加成功！"
      redirect_to @event
    else
      render 'photos/new'
    end
  end

  def edit
    @photo = Photo.find(params[:id])
    @event = @photo.event
  end

  def update
    @photo = Photo.find(params[:id])
    @event = @photo.event
    if @photo.update_attributes(photo_params)
      flash[:success] = "成功修改！"
      redirect_to @event
    else
      render 'photos/edit'
    end
  end

  def destroy
    @event = Event.find(params[:event_id])
    @photo = Photo.find(params[:id])
    @photo.destroy
    redirect_to @event
  end

  def delete_image
    image = ActiveStorage::Attachment.find(params[:id])
    image.purge
    redirect_to edit_photo_path(
                    @photo,
                    photo_id: @photo.id,
                    event_id: @event.id
                )
  end

  private

  def photo_params
    params.require(:photo).permit(:description, :image, :portrait)
  end
end
