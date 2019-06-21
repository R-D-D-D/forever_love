class EventsController < ApplicationController
  before_action :logged_in_user

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def show
    @event = Event.find(params[:id])
    @portrait_photos = @event.photos.where(portrait: true)
    @landscape_photos = @event.photos.where(portrait: false)
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

  def photos

  end

  def videos

  end

  private

  def event_params
    params.require(:event).permit(:name, :description, :date, :thumbnail)
  end
end
