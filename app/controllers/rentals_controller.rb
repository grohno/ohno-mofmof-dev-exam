class RentalsController < ApplicationController
  before_action :set_rental, only: %i[ show edit update destroy ]

  def index
    @rentals = Rental.all
  end

  def show
  end

  def new
    if params[:back]
      @rental = Rental.new(rental_params)
      2.times { @rental.stations.build }
    else
      @rental = Rental.new
      2.times { @rental.stations.build }
    end
  end

  def confirm
    @rental = Rental.new(rental_params)
    render :new if @rental.invalid?
  end

  def edit
    @rental.stations.build
  end

  def create
    @rental = Rental.new(rental_params)

    respond_to do |format|
      if @rental.save
        format.html { redirect_to @rental, notice: "Rental was successfully created." }
        format.json { render :show, status: :created, location: @rental }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @rental.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @rental.update(rental_params)
        format.html { redirect_to @rental, notice: "Rental was successfully updated." }
        format.json { render :show, status: :ok, location: @rental }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @rental.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @rental.destroy
    respond_to do |format|
      format.html { redirect_to rentals_url, notice: "Rental was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  def set_rental
    @rental = Rental.find(params[:id])
  end

  def rental_params
    params.require(:rental).permit(:rent_property_name, :rent, :address, :building_age, :note, stations_attributes: [:id, :route_name, :station_name, :walk_fraction])
  end
end
