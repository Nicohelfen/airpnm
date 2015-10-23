class BookingsController < ApplicationController
  before_action :set_whitelist, only: [:create]
  before_action :authenticate_user!
  before_action :set_flat, only: [:new, :create]

  def new
    if current_user != @flat.owner
      @booking = @flat.bookings.build(guest: current_user, flat: @flat)
    else
      flash[:alert] = "You cannot book your own flat"
      redirect_to flat_path(@flat)
    end
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
