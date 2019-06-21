class EventsController < ApplicationController
  before_action :logged_in_user

  def index
    @events = Event.paginate(page: params[:page])
  end

  def new
    @event = Event.new
  end

  def show
    @event = Event.find(params[:id])
    @portrait_photos = @event.photos.where(portrait: true).paginate(page: params[:page])
    @landscape_photos = @event.photos.where(portrait: false).paginate(page: params[:page])
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      flash[:success] = "成功建立新相册！"
      redirect_to events_path
    else
      render 'new'
    end
  end
  
  def edit
    @event = Event.find(params[:id])
  end
  
  def update
    @event = Event.find(params[:id])
    if @event.update_attributes(event_params)
      flash[:success] = "编辑成功!"
      redirect_to @event
    else
      render 'edit'
    end
  end
  
  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to events_path
  end
  
  def photos

  end

  def videos

  end

  private

  def event_params
    params.require(:event).permit(:name, :description, :date, :thumbnail)
  end
end
