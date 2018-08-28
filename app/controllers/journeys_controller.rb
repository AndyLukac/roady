class JourneysController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    @journey = Journey.all
  end

  def show
    @journey = Journey.find(params[:id])
    @accommodation = Accommodation.all
    @flight = Flight.all
    @train = Train.all
    @car = Car.all
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
      render :new
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

  def journey_params
    params.require(:journey).permit(:name, :date, :photo)
  end
end
