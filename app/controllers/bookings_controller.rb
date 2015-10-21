class BookingsController < ApplicationController
  before_action :set_whitelist, only: [:create]
  before_action :authenticate_user!
  before_action :set_flat, only: [:index, :accept, :new, :create]

  def index
    if @flat && @flat.owner == current_user
      @bookings = @flat.bookings
    end
  end

  def accept
    if current_user == @flat.owner
      booking = Booking.find(params[:booking_id])
      booking.update(status: "OK")
    end
    redirect_to flat_bookings_path
  end

  def new
    @booking = @flat.bookings.build(guest: current_user, flat: @flat)
  end

  def create
    @whitelist[:status] = "Waiting"
    booking = Booking.new(@whitelist)
    booking.save
    if booking.valid?
      redirect_to flat_path(@flat)
    else
      render "new"
    end
  end

  private
  def set_flat
    @flat = Flat.find(params[:flat_id])
  end

  def set_whitelist
    @whitelist = params.require(:booking).permit(:check_in, :check_out, :guest_id, :flat_id)
  end
end
