class BookingsController < ApplicationController
  before_action :logged_in?, only: :create

  load_resource

  def index
    @bookings = Booking.current_order(current_user)
      .group_by{|booking| booking.space.venue}
  end

  def create
    @booking = Booking.new booking_params
    @booking.save
  end

  private
  def booking_params
    params.require(:booking).permit(:space_id, :booking_from, :duration,
      :booking_type_id, :quantity).merge! user: current_user
  end
end
