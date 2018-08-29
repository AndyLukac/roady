class JourneysController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    @journeys = Journey.all
  end

  def show
    @journey = Journey.find(params[:id])
    @markers = []
    flight_markers

    car_markers

    train_markers

    accommodation_markers
    puts "debug"
    p @markers.flatten
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

  private

  def journey_params
    params.require(:journey).permit(:name, :date, :photo)
  end

  def flight_markers
    @flights = @journey.flights
    p "j'imprime les flights"
    p @flights

      @markers << @flights.map do |flight|
        [{
          lat: flight.departure_latitude,
          lng: flight.departure_longitude,
          infoWindow: { content: flight.departure_place }
        },
        {
          lat: flight.arrival_latitude,
          lng: flight.arrival_longitude,
          infoWindow: { content: flight.arrival_place }
        }]
        end.flatten
  end

  def train_markers
    @trains = @journey.trains

      @markers << @trains.map do |train|
        [{
          lat: train.departure_latitude,
          lng: train.departure_longitude,
          infoWindow: { content: train.departure_place }
        },
        {
          lat: train.arrival_latitude,
          lng: train.arrival_longitude,
          infoWindow: { content: train.arrival_place }
        }]
        end.flatten
  end

  def car_markers
    @cars = @journey.cars

      @markers << @cars.map do |car|
        [{
          lat: car.departure_latitude,
          lng: car.departure_longitude,
          infoWindow: { content: car.departure_place }
        },
        {
          lat: car.arrival_latitude,
          lng: car.arrival_longitude,
          infoWindow: { content: car.arrival_place }
        }]
      end.flatten
  end

  def accommodation_markers
    @accommodations = @journey.accommodations

      @markers << @accommodations.map do |accommodation|
        {
        lat: accommodation.latitude,
        lng: accommodation.longitude,
        infoWindow: { content: accommodation.name }
        }
      end
  end

end
