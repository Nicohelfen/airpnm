module Account
  class BookingsController < ApplicationController
   # before_action :set_flat, only: [:index]
   before_action :authenticate_user!

   def index
    flats = current_user.flats
    @bookings_from_other = []
    flats.each do |f|
      @bookings_from_other << f.bookings.flatten
    end
    @bookings_from_other.flatten!
    @bookings_to_me = current_user.bookings.flatten
  end

  def accept
    booking = Booking.find(params[:id])
    if booking.flat.owner == current_user
      booking.update(status: "Accepted")
    end
    redirect_to account_bookings_path
  end

  # private
  # def set_flat
  #   @flat = Flat.find(params[:flat_id])
  # end

end
end
