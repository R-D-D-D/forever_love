class StaticPagesController < ApplicationController
  def home
    @events = Event.paginate(page: params[:page])
  end
end
