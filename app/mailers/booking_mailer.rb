class BookingMailer < ApplicationMailer

  def booking_email(booking)
    @booking = booking
    mail(to: @booking.bill.email, subject: "Your booking with flyAway.com")
  end
end
