class TheBooking::TimeController < TheBooking::BaseController

  def repeat_form
    @booking = params[:booking_type].classify.constantize.new
    @booking.repeat_type = params[:repeat_type]
    if @booking.repeat_type_changed?
      @booking.repeat_days = []
    end
  end

end
