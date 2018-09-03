class JourneysController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    @journeys = Journey.all
    @journey = Journey.new
  end

  def show
    @journey = Journey.find(params[:id])
    journey_items_markers
    journey_items_paths
  end

  def new
    @journey = Journey.new
  end

  def create
    @journey = Journey.new(journey_params)
    @journey.user = current_user

    if @journey.save
      redirect_to journeys_path
    else
      redirect_to root_path
    end
  end

  def edit
    @journey = Journey.find(params[:id])
  end

  def update
    @journey = Journey.find(params[:id])
    @journey.update(journey_params)
    redirect_to journeys_path
  end

  private

  def journey_params
    params.require(:journey).permit(:name, :start_date, :end_date, :photo)
  end

  def journey_items_paths
    @path = []
    @journey_items = JourneyItem.where(journey_id: params[:id]).order(departure_date: :asc)
    @journey_items.map do |journey_item|
      if journey_item.type != 'Accommodation'
        @path << [journey_item.departure_latitude, journey_item.departure_longitude]
        @path << [journey_item.arrival_latitude, journey_item.arrival_longitude]
      else
        @path << [journey_item.latitude, journey_item.longitude]
      end
    end
  end

  def journey_items_markers
    @markers = []
    @journey_items = JourneyItem.where(journey_id: params[:id])
    @markers << @journey_items.map do |journey_item|
      if journey_item.type != 'Accommodation'
        [{
          lat: journey_item.departure_latitude,
          lng: journey_item.departure_longitude,
          infoWindow: { content: journey_item.departure_place },
          icon: image_path('pins.png')
        },
        {
          lat: journey_item.arrival_latitude,
          lng: journey_item.arrival_longitude,
          infoWindow: { content: journey_item.arrival_place },
          icon: image_path('pins.png')
        }]
      else
        {
          lat: journey_item.latitude,
          lng: journey_item.longitude,
          infoWindow: { content: journey_item.name },
          icon: image_path('pins.png')
        }
      end
    end
  end

  def image_path(name)
    ActionController::Base.helpers.asset_path(name)
  end
end
