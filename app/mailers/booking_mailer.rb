class BookingMailer < ApplicationMailer


  def student_booking_email(booking)
    @booking = booking

    make_bootstrap_mail(
      to: booking.user.email,
      subject: "Lesson Booked with #{booking.account.owner.username.capitalize}"
    )
  end


  def booking_notification_email(owner, booking)
    @owner = owner
    @booking = booking

    make_bootstrap_mail(
      to: owner.email,
      subject: "New Lesson Booking on PerTutor"
    )
  end
end
